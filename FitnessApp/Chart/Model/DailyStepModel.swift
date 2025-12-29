//
//  DailyStepModel.swift
//  FitnessApp
//
//  Created by Emirhan Gökçe on 30.12.2025.
//

import Foundation
struct DailyStepModel : Identifiable{
    let id =  UUID()
    let date : Date
    let count : Int
}
