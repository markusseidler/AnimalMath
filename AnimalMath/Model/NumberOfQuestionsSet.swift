//
//  File.swift
//  AnimalMath
//
//  Created by Markus Seidler on 16/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import Foundation

//https://stackoverflow.com/questions/27706832/can-swift-enums-have-multiple-raw-values

// create a struct as EnvironmentObject rather than use this enum
// Struct with this enum as input and with highestnumber as second input

enum NumberOfQuestionsSet: CaseIterable {
    
    case five
    case ten
    case twenty
    case all
    
    var asInteger: Int {
        switch self {
        case .five:
            return 5
        case .ten:
            return 10
        case .twenty:
            return 20
        case .all:
            return 88888888
        }
    }
    
    var asString: String {
        switch self {
        case .five:
            return "Five"
        case .ten:
            return "Ten"
        case .twenty:
            return "Twenty"
        case .all:
            return "All"
        }
    }
}
