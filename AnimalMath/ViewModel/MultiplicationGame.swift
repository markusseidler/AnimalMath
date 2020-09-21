//
//  MutliplicationGame.swift
//  AnimalMath
//
//  Created by Markus Seidler on 16/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import Foundation

class MultiplicationGame: ObservableObject {
    
    var maxNumber: NumberOfQuestionsSet = .five
    
    var highestNumber: Int = 6

    var colorArray: [FavoriteColor] {
        multiplicationTable.colorArray
    }
    
    var selectedColor: FavoriteColor? {
        multiplicationTable.colorSelected
    }
    
    var animalArray: [DisplayItem<String>] {
        multiplicationTable.displayItems
    }
    
    var animalSelected: DisplayItem<String>? {
        multiplicationTable.displayItemSelected
    }
    
    var calculationResult: [Double] {
        multiplicationTable.calculationResults
    }

    static let animalNames: [String] = ["cow", "elephant", "chick", "panda", "dog", "pig"]
    
    init() {
           multiplicationTable = CalculationTable(numberOfQuestionsEnum: maxNumber, highestNumber: highestNumber, displayContentArray: MultiplicationGame.animalNames, operation: { (left, right) -> Double in
               left * right
           })
           
       }
    
    
    // MARK: - Private Properties
    
    @Published private var multiplicationTable: CalculationTable<String>
    
//    @Published private var multiplicationTable: CalculationTable<String> = MultiplicationGame.createMultiplicationTable()
//
//    private static func createMultiplicationTable() -> CalculationTable<String> {
//
//        return CalculationTable(numberOfQuestionsEnum: maxNumber, highestNumber: 5, displayContentArray: animalNames) { left, right in
//            left * right
//        }
//    }
    
//    @Published private var multiplicationTable = CalculationTable(numberOfQuestionsEnum: maxNumber, highestNumber: 5, displayContentArray: animalNames) { (left, right) -> Double in
//        left * right
//    }
    
//    init() {
//        self.maxNumber = .five
//        multiplicationTable = CalculationTable(numberOfQuestionsEnum: maxNumber, highestNumber: 5, displayContentArray: MultiplicationGame.animalNames, operation: { (left, right) -> Double in
//            left * right
//        })
//
//    }
//
//
//
    
    // MARK: - Public Methods - User Intent
    
    func colorSelected(color: FavoriteColor) {
        multiplicationTable.colorTapped(color: color)
    }
    
    func animalSelected(animalName: String) {
        multiplicationTable.displayItemTapped(of: animalName)
    }
    
    func startGame() {
        multiplicationTable = CalculationTable(numberOfQuestionsEnum: maxNumber, highestNumber: highestNumber, displayContentArray: MultiplicationGame.animalNames, operation: { (left, right) -> Double in
            left * right
        })
    }
}
