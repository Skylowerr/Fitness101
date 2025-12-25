//
//  WorkoutCard.swift
//  FitnessApp
//
//  Created by Emirhan Gökçe on 25.12.2025.
//

import SwiftUI

struct Workout : Identifiable{
    let id = UUID()
    let title : String
    let image : String
    let duration : String
    let date : String
    let calories : String
    let tintColor : Color
    
}

struct WorkoutCard: View {
    @State var workout : Workout
    var body: some View {
        HStack{
            Image(systemName: workout.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48,height: 48)
                .foregroundStyle(workout.tintColor)
                .padding()
                .background(.gray.opacity(0.1))
                .cornerRadius(10)
            
            
            VStack{
                HStack{
                    Text(workout.title)
                        .font(.title3)
                        .bold()
                    
                    Spacer()
                    
                    Text(workout.duration)
                    
                    
                }
                
                HStack{
                    Text(workout.date)
                    
                    Spacer()
                    
                    Text(workout.calories)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    WorkoutCard(workout: Workout(title: "Running", image: "figure.run", duration: "51 mins", date: "Aug 1", calories: "512 kcal", tintColor: .green))
}
