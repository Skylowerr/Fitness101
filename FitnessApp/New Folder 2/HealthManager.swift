//
//  HealthManager.swift
//  FitnessApp
//
//  Created by Emirhan Gökçe on 25.12.2025.
//

import Foundation
import HealthKit

extension Date{
    static var startOfDay : Date{
        let calendar = Calendar.current
        return calendar.startOfDay(for: Date())
    }
}
class HealthManager{
    
    static let shared = HealthManager()
    let healthStore = HKHealthStore() //Create a store
    private init(){
        Task{
            do{
                try await requestHealthKitAccess()
            }catch{
                print(error.localizedDescription)
            }
        }
        
        
    } //Bir kere başlatır. Projenin her yerinden ulaşmanı sağlar
    
    //TODO: ANLAT
    
    func requestHealthKitAccess() async throws{
        //Çekmek istediğimiz veriler
        let calories = HKQuantityType(.activeEnergyBurned)
        let exercise = HKQuantityType(.appleExerciseTime)
        let stand = HKCategoryType(.appleStandHour)
        
        let healthTypes : Set = [calories, exercise, stand]
        
        try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
    }
    
    func fetchTodayCaloriesBurned(completion : @escaping(Result<Double,Error>)-> Void){
        let calories = HKQuantityType(.activeEnergyBurned) //TODO: Bunu neden tekrar yazıyoruz?
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate) { _, results, error in
            guard let quantity = results?.sumQuantity(), error == nil else {
                completion(.failure(URLError(.badURL)))
                return
            }
            
            let calorieCount = quantity.doubleValue(for: .kilocalorie())
            completion(.success(calorieCount))
        }
        healthStore.execute(query)
    }
    
    func fetchTodayExerciseTime(completion : @escaping(Result<Double,Error>)-> Void){
        let exercise = HKQuantityType(.appleExerciseTime)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: exercise, quantitySamplePredicate: predicate) { _, results, error in
            guard let quantity = results?.sumQuantity(), error == nil else {
                completion(.failure(URLError(.badURL)))
                return
            }
            
            let exerciseTime = quantity.doubleValue(for: .minute())
            completion(.success(exerciseTime))
        }
        healthStore.execute(query)
    }
    
    
    
    func fetchTodayStandHours(completion : @escaping(Result<Int,Error>)-> Void){
        let stand = HKCategoryType(.appleStandHour)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKSampleQuery(sampleType: stand, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { _, results, error in
            guard let samples = results as? [HKCategorySample], error == nil else {
                completion(.failure(URLError(.badURL)))
                return
            }
            print(samples)
            print(samples.map({$0.value}))
            let standCount = samples.filter({$0.value == 0}).count
            completion(.success(standCount))
        }
        
        healthStore.execute(query)
    }
}
