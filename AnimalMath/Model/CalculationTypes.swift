//
//  CalculationTypes.swift
//  AnimalMath
//
//  Created by Markus Seidler on 29/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import Foundation

enum CalculationTypes {
    case addition
//    case division
    case multiplication
    case subtraction
    
    var asFunction: (Double, Double) -> Double {
        switch self {
        case .addition:
            return {(left, right) -> Double in left + right}
//        case .division:
//            return {(left, right) -> Double in left / right}
        case .multiplication:
            return {(left, right) -> Double in left * right}
        case .subtraction:
            return {(left, right) -> Double in left - right}
        }
    }
}
