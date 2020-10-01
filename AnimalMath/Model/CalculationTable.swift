//
//  CalculationTable.swift
//  AnimalMath
//
//  Created by Markus Seidler on 16/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import Foundation

 
struct CalculationTable<DisplayContent> where DisplayContent: Equatable & Hashable {
    
    // MARK: - Public properties
    
    var leftSideNumbers: [Double] = []
    var rightSideNumbers: [Double] = []
    var calculationResults: [Double] = []
    
    var displayItemSelected: DisplayItem<DisplayContent>? {
        get {
            displayItems.first {$0.isSelected}
        }
    }
    
    private (set) var displayItems = [DisplayItem<DisplayContent>]()
    private var maximumNumberOfCalculations: Int {
        self.highestCalculationInput * self.highestCalculationInput
    }
    
    init(numberOfQuestionsEnum: NumberOfQuestionsSet, highestNumber: Int, displayContentArray: [DisplayItem<DisplayContent>], operation: (Double, Double) -> Double) {
        self.highestCalculationInput = highestNumber
        self.allPotentialInputs = [Int](1...self.highestCalculationInput)
        self.numberOfQuestions = numberOfQuestionsEnum.asInteger
        self.selectRandomInputsAndCalculateResults(operation: operation)
        
        self.displayItems = displayContentArray
        
//        for content in displayContentArray {
//            self.displayItems.append(DisplayItem(content: content))
//        }
    }
    
    // MARK: - Private properties
    
    private var numberOfQuestions: Int = 0
    private let highestCalculationInput: Int
    private let allPotentialInputs: [Int]
    
    
    // MARK: - Public methods
    
    mutating func displayItemTapped(of content: DisplayContent) {

        let countTappedDisplay = self.displayItems.filter {$0.isSelected}.count
        
        let tappedIndexDisplay = self.displayItems.firstIndex {$0.content == content}!
        
        let isTappedDisplay = self.displayItems[tappedIndexDisplay].isSelected
        
        if isTappedDisplay {
            self.displayItems[tappedIndexDisplay].isSelected = false
        } else if !isTappedDisplay && countTappedDisplay == 0 {
            self.displayItems[tappedIndexDisplay].isSelected = true
        }
    }
    
    
    // MARK: - Private methods
    
    private mutating func selectRandomInputsAndCalculateResults(operation: (Double, Double) -> Double) {
        
        var amountOfCalculations: Int
        
        if numberOfQuestions == 88888888 || maximumNumberOfCalculations <= numberOfQuestions {
            amountOfCalculations = maximumNumberOfCalculations
        } else {
            amountOfCalculations = numberOfQuestions
        }
        
        for _ in 0..<amountOfCalculations {
            leftSideNumbers.insert(Double(allPotentialInputs.randomElement()!), at: 0)
            rightSideNumbers.insert(Double(allPotentialInputs.randomElement()!), at: 0)
        }
        
        calculationResults = zip(leftSideNumbers, rightSideNumbers).map() {(left, right) in operation(left, right)}
        
    }
    
}

