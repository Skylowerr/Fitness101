//
//  HistoricDataView.swift
//  FitnessApp
//
//  Created by Emirhan Gökçe on 25.12.2025.
//

import SwiftUI
import Charts

struct DailyStepModel : Identifiable{
    let id =  UUID()
    let date : Date
    let count : Double
}

//MARK: .allCases için CaseIterable, .rawValue için String
enum ChartOptions : String, CaseIterable{
    case oneWeek = "1W"
    case oneMonth = "1M"
    case threeMonth = "3M"
    case yearToDate = "YTD"
    case oneYear = "1Y"
}

class ChartsViewModel: ObservableObject{
    var mochChartData = [
        DailyStepModel(date: Date(), count: 12315),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(), count: 12315),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date(), count: 123),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(), count: 456),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -4, to: Date()) ?? Date(), count: 4564),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -5, to: Date()) ?? Date(), count: 3423),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -6, to: Date()) ?? Date(), count: 12315),
    ]
    
    @Published var mockOneMonthData = [DailyStepModel]()
    @Published var mockThreeMonthData = [DailyStepModel]()
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
            let dailyStepData = DailyStepModel(date: currentDate, count: Double(randomStepCount))
            mockData.append(dailyStepData)
        }
        return mockData

    }
}


struct ChartsView: View {
    @StateObject var viewModel = ChartsViewModel()
    @State var selectedChart : ChartOptions = .oneWeek
    var body: some View {
        VStack {
            Text("Charts")
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            ZStack{
                switch selectedChart {
                case .oneWeek:
                    Chart{
                        ForEach(viewModel.mochChartData){data in
                            BarMark(x: .value(data.date.formatted(), data.date, unit:.day), y: .value("Steps", data.count))
                        }
                    }
                case .oneMonth:
                    Chart{
                        ForEach(viewModel.mockOneMonthData){data in
                            BarMark(x: .value(data.date.formatted(), data.date, unit:.day), y: .value("Steps", data.count))
                        }
                    }
                case .threeMonth:
                    Chart{
                        ForEach(viewModel.mockThreeMonthData){data in
                            BarMark(x: .value(data.date.formatted(), data.date, unit:.day), y: .value("Steps", data.count))
                        }
                    }
                case .yearToDate:
                    EmptyView()
                case .oneYear:
                    Chart{
                        ForEach(viewModel.mochChartData){data in
                            BarMark(x: .value(data.date.formatted(), data.date, unit:.day), y: .value("Steps", data.count))
                        }
                    }
                }
            }
            .foregroundStyle(.green)
            .frame(maxHeight: 350)
            .padding(.horizontal)
            
            
            HStack{
                ForEach(ChartOptions.allCases, id: \.self){option in
                    Button(option.rawValue){
                        withAnimation {
                            selectedChart = option
                        }
                    }
                    .padding()
                    .foregroundStyle(selectedChart == option ? .white : .green)
                    .background(selectedChart == option ? .green : .clear)
                    .cornerRadius(10)
                }
                
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        
    }
}
#Preview {
    ChartsView()
}
