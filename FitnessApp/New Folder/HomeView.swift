//
//  HomeView.swift
//  FitnessApp
//
//  Created by Emirhan Gökçe on 25.12.2025.
//

import SwiftUI

struct HomeView: View {
    @State var calories : Int = 123
    @State var active : Int = 123
    @State var stand : Int = 8
    
    var mockActivities = [
        
        Activity(title: "Today steps", subtitle: "Goal 12.000", image: "figure.walk", tintColor: .green, amount: "9.812"),
        
        Activity(title: "Today steps", subtitle: "Goal 12.000", image: "figure.walk", tintColor: .red, amount: "9.812"),
        
        Activity(title: "Today steps", subtitle: "Goal 12.000", image: "figure.walk", tintColor: .blue, amount: "9.812"),
        
        Activity(title: "Today steps", subtitle: "Goal 52.000", image: "figure.walk", tintColor: .purple, amount: "104.812")
    ]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading){
                Text("Welcome")
                    .font(.largeTitle)
                    .padding()
                
                HStack{
                    
                    Spacer()
                    
                    
                    VStack{
                        VStack(alignment: .leading, spacing:8){
                            Text("Calories")
                                .font(.callout)
                                .bold()
                                .foregroundStyle(.red)
                            
                            Text("123 kcal")
                                .bold()
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing:8){
                            Text("Active")
                                .font(.callout)
                                .bold()
                                .foregroundStyle(.green)
                            
                            Text("52 mins")
                                .bold()
                        }
                        .padding(.bottom)

                        
                        VStack(alignment: .leading, spacing:8){
                            Text("Stand")
                                .font(.callout)
                                .bold()
                                .foregroundStyle(.blue)
                            
                            Text("8 hours")
                                .bold()
                        }
                    }
                    
                    Spacer()
                    
                    ZStack{
                        ProgressCircleView(progress: $calories, goal: 600, color: .red)
                        
                        ProgressCircleView(progress: $active, goal: 60, color: .green)
                            .padding(.all,20)
                        
                        ProgressCircleView(progress: $stand, goal: 12, color: .blue)
                            .padding(.all,20)

                    }
                    .padding(.horizontal)
                    Spacer()

                }
                .padding()
                
                HStack{
                    Text("Fitness Activity")
                        .font(.title2)
                    
                    Spacer()
                    
                    Button {
                        print("show more")
                    } label: {
                        Text("Show more")
                            .padding(.all, 10)
                            .foregroundStyle(.white)
                            .background(.blue)
                            .cornerRadius(20)
                    }
                }
                .padding(.horizontal)
                
                LazyVGrid(columns: Array(repeating: GridItem(spacing:20), count: 2)) {
                    ForEach(mockActivities) { activity in
                        ActivityCard(activity: activity)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomeView()
}
