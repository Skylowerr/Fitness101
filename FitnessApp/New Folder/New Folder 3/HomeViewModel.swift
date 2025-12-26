//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Emirhan Gökçe on 25.12.2025.
//

import Foundation

class HomeViewModel: ObservableObject{
     let healthManager = HealthManager.shared
     @Published var calories : Int = 123
     @Published var exercise : Int = 123 //TODO: exercise
     @Published var stand : Int = 8
    
    @Published var activities = [Activity]() //TODO: () ne oluyor? Inıtializes as an empty array?

    //Burası değişirse alttaki stateObject de değişsin diye @Published diyoruz
    @Published var mockActivities = [
        
        Activity(title: "Today steps", subtitle: "Goal 12.000", image: "figure.walk", tintColor: .green, amount: "9.812"),
        
        Activity(title: "Today steps", subtitle: "Goal 12.000", image: "figure.walk", tintColor: .red, amount: "9.812"),
        
        Activity(title: "Today steps", subtitle: "Goal 12.000", image: "figure.walk", tintColor: .blue, amount: "9.812"),
        
        Activity(title: "Today steps", subtitle: "Goal 52.000", image: "figure.walk", tintColor: .purple, amount: "104.812")
    ]
    
    @Published var mockWorkouts = [
        Workout(title: "Running", image: "figure.run", duration: "12 mins", date: "Aug 1", calories: "122 kcal",tintColor: .green),
        
        Workout(title: "Walking", image: "figure.run", duration: "89 mins", date: "Aug 2", calories: "896 kcal",tintColor: .red),
        
        Workout(title: "Running", image: "figure.run", duration: "51 mins", date: "Aug 3", calories: "522 kcal",tintColor: .blue),
        
        Workout(title: "Running", image: "figure.run", duration: "5 mins", date: "Aug 4", calories: "52 kcal",tintColor: .green)
        
        
    ]
    
    init(){
        Task{
            do{
                try await healthManager.requestHealthKitAccess()
                fetchTodayCalories()
                fetchTodayExerciseTime()
                fetchTodayStandHours()
                fetchTodaysSteps()
                fetchCurrentWeekActivities()

            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchTodayCalories(){
        healthManager.fetchTodayCaloriesBurned { result in
            switch result {
            case .success(let calories):
                DispatchQueue.main.async {
                    self.stand = Int(calories)
                    let activity = Activity(title: "Calories Burned", subtitle: "Today", image: "flame", tintColor: .red, amount: calories.formattedNumberString())
                    self.activities.append(activity)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchTodayExerciseTime(){
        healthManager.fetchTodayExerciseTime { result in
            switch result {
            case .success(let exercise):
                DispatchQueue.main.async {
                    self.stand = Int(exercise)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchTodayStandHours(){
        healthManager.fetchTodayStandHours { result in
            switch result {
            case .success(let hours):
                DispatchQueue.main.async {
                    self.stand = hours
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    //MARK: Fitness Activity
    func fetchTodaysSteps(){
        healthManager.fetchTodaySteps { result in
            switch result {
            case .success(let activity):
                DispatchQueue.main.async {
                    self.activities.append(activity)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchCurrentWeekActivities(){
        healthManager.fetchCurrentWeekWorkoutStats { result in
            switch result {
            case .success(let activities):
                DispatchQueue.main.async {
                    self.activities.append(contentsOf: activities)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
}
