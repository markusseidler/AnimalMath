//
//  File.swift
//  AnimalMath
//
//  Created by Markus Seidler on 16/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import Foundation

//https://stackoverflow.com/questions/27706832/can-swift-enums-have-multiple-raw-values

enum NumberOfQuestionsSet {
    case five
    case ten
    case twenty
    case all(Int)
    
    var asInteger: Int {
        switch self {
        case .five:
            return 5
        case .ten:
            return 10
        case .twenty:
            return 20
        case let .all(total):
            return total
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
