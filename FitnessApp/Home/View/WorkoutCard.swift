//
//  WorkoutCard.swift
//  FitnessApp
//
//  Created by Emirhan Gökçe on 25.12.2025.
//

import SwiftUI

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
                        .lineLimit(1) //1 satıra sıkıştır
                        .minimumScaleFactor(0.5) // bu kadar düşebilir
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
