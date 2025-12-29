//
//  Workout.swift
//  FitnessApp
//
//  Created by Emirhan Gökçe on 25.12.2025.
//

import Foundation
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
