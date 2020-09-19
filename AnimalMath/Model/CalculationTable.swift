//
//  CalculationTable.swift
//  AnimalMath
//
//  Created by Markus Seidler on 16/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import Foundation


struct CalculationTable {
    
    // MARK: - Public properties
    
    var leftSideNumbers: [Double] = []
    var rightSideNumbers: [Double] = []
    var calculationResults: [Double] = []
    
    var colorArray: [FavoriteColor] = [
    FavoriteColor(color: .blue),
    FavoriteColor(color: .gray),
    FavoriteColor(color: .green),
    FavoriteColor(color: .orange),
    FavoriteColor(color: .pink),
    FavoriteColor(color: .purple),
    FavoriteColor(color: .red),
    FavoriteColor(color: .yellow)]
    
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
    
    mutating func colorTapped(color: FavoriteColor) {
        
        let countTapped = self.colorArray.filter { (favColor) -> Bool in
            favColor.isSelected
        }.count
        
        if let tappedIndex = self.colorArray.firstIndex(of: color) {
            
            let isTapped = self.colorArray[tappedIndex].isSelected
            
            if isTapped {
                self.colorArray[tappedIndex].isSelected = false
            } else if !isTapped && countTapped == 0 {
                self.colorArray[tappedIndex].isSelected = true
            }
        }
        
    
    }

    // MARK: - Private methods
    
    private mutating func selectRandomInputsAndCalculateResults(operation: (Double, Double) -> Double) {
        for _ in 0..<numberOfQuestions {
            leftSideNumbers.insert(Double(allPotentialInputs.randomElement()!), at: 0)
            rightSideNumbers.insert(Double(allPotentialInputs.randomElement()!), at: 0)
        }
        
        calculationResults = zip(leftSideNumbers, rightSideNumbers).map() {(left, right) in operation(left, right)}
        
        
    }
    
}
