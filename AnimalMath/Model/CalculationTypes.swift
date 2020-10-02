//
//  CalculationTypes.swift
//  AnimalMath
//
//  Created by Markus Seidler on 29/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import Foundation

enum CalculationTypes: String, CaseIterable {
    case addition = "Addition"
//    case division
    case multiplication = "Multiplication"
    case subtraction = "Subtraction"
    
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
    
    var asQuestionLabel: QuestionLabels {
        switch self {
        case .addition:
            return QuestionLabels.added
        case .multiplication:
            return QuestionLabels.multiplied
        case .subtraction:
            return QuestionLabels.subtracted
        }
         
    }
}
