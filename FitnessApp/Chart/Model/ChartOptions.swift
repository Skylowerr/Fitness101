//
//  ChartOptions.swift
//  FitnessApp
//
//  Created by Emirhan Gökçe on 30.12.2025.
//

import Foundation
//MARK: .allCases için CaseIterable, .rawValue için String
enum ChartOptions : String, CaseIterable{
    case oneWeek = "1W"
    case oneMonth = "1M"
    case threeMonth = "3M"
    case yearToDate = "YTD"
    case oneYear = "1Y"
}
