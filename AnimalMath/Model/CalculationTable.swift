//
//  CalculationTable.swift
//  AnimalMath
//
//  Created by Markus Seidler on 16/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import Foundation

//enum numberOfQuestionsAvailable {
//    case five
//    case ten
//    case twenty
//    case all
//}

struct CalculationTable {
    
    // MARK: - Public properties
    
    var leftSideNumbers: [Double] = []
    var rightSideNumbers: [Double] = []
    var calculationResults: [Double] = []
//    var operation: (Int, Int) -> Int
    
    init(numberOfQuestionsEnum: NumberOfQuestionsSet, highestNumber: Int, operation: (Double, Double) -> Double) {
        self.highestCalculationInput = highestNumber
        self.allPotentialInputs = [Int](1...self.highestCalculationInput)
        self.numberOfQuestions = numberOfQuestionsEnum.asInteger
        self.selectRandomInputsAndCalculateResults(operation: operation)
        
    }
    
    // MARK: - Private properties
    
    private var numberOfQuestions: Int = 0
    private let highestCalculationInput: Int
    private let allPotentialInputs: [Int]
    
    // MARK: - Public methods

    // MARK: - Private methods
    
//    private func convertEnum(by numberOfQuestionsEnum: numberOfQuestionsSet) -> Int {
//        switch numberOfQuestionsEnum {
//        case .five: return 5
//        case .ten: return 10
//        case .twenty: return 20
//        case .all: return allPotentialInputs.count
//        }
//    }
    
    private mutating func selectRandomInputsAndCalculateResults(operation: (Double, Double) -> Double) {
        for _ in 0..<numberOfQuestions {
            leftSideNumbers.insert(Double(allPotentialInputs.randomElement()!), at: 0)
            rightSideNumbers.insert(Double(allPotentialInputs.randomElement()!), at: 0)
        }
        
        calculationResults = zip(leftSideNumbers, rightSideNumbers).map() {(left, right) in operation(left, right)}
        
        
    }
    
}
