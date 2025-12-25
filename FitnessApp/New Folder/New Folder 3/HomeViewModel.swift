//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Emirhan Gökçe on 25.12.2025.
//

import Foundation

class HomeViewModel: ObservableObject{
     var calories : Int = 123
     var active : Int = 123
     var stand : Int = 8

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
    
}
