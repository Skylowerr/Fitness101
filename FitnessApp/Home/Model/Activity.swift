//
//  Activity.swift
//  FitnessApp
//
//  Created by Emirhan Gökçe on 25.12.2025.
//

import Foundation
import SwiftUI
struct Activity : Identifiable{
    let id = UUID()
    let title : String
    let subtitle: String
    let image : String
    let tintColor : Color
    let amount : String
}
