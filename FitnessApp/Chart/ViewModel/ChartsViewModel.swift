//
//  ChartsViewModel.swift
//  FitnessApp
//
//  Created by Emirhan Gökçe on 30.12.2025.
//

import Foundation
class ChartsViewModel: ObservableObject{
    var mockWeekChartData = [
        DailyStepModel(date: Date(), count: 12315),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(), count: 12315),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date(), count: 123),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(), count: 456),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -4, to: Date()) ?? Date(), count: 4564),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -5, to: Date()) ?? Date(), count: 3423),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -6, to: Date()) ?? Date(), count: 12315),
    ]
    
    var mockYTDChartData = [
        MonthlyStepModel(date: Date(), count: 12315),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date(), count: 12315),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -2, to: Date()) ?? Date(), count: 1232),
        MonthlyStepModel(date: Date(), count: 12315),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -3, to: Date()) ?? Date(), count: 12315),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -4, to: Date()) ?? Date(), count: 31253),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -5, to: Date()) ?? Date(), count: 6786),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -6, to: Date()) ?? Date(), count: 7794),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -7, to: Date()) ?? Date(), count: 11264),
    ]
    
    @Published var mockOneMonthData = [DailyStepModel]()
    @Published var mockThreeMonthData = [DailyStepModel]()
    
    @Published var oneWeekAverage = 1243
    @Published var oneWeekTotal = 8723
    
    @Published var oneMonthAverage = 3455
    @Published var oneMonthTotal = 5677
    
    @Published var threeMonthAverage = 12336
    @Published var threeMonthTotal = 34536
    
    @Published var ytdAverage = 56846
    @Published var ytdTotal = 156165
    
    @Published var oneYearAverage = 123550
    @Published var oneYearTotal = 2131231
    
    
    
    
    init(){
        var mockOneMonth = self.mockDataForDays(days: 30)
        var mockThreeMonths = self.mockDataForDays(days: 90)
        DispatchQueue.main.async{
            self.mockOneMonthData = mockOneMonth
            self.mockThreeMonthData = mockThreeMonths
        }
    }
    
    func mockDataForDays(days: Int) -> [DailyStepModel]{
        var mockData = [DailyStepModel]()
        for day in 0..<days{
            let currentDate = Calendar.current.date(byAdding: .day, value: -day, to: Date()) ?? Date()
            
            let randomStepCount = Int.random(in: 500...15000)
            let dailyStepData = DailyStepModel(date: currentDate, count: randomStepCount)
            mockData.append(dailyStepData)
        }
        return mockData

    }
}

