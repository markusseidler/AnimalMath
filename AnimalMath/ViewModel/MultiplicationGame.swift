//
//  MutliplicationGame.swift
//  AnimalMath
//
//  Created by Markus Seidler on 16/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import Foundation

class MultiplicationGame: ObservableObject {
    

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
    
    static let animalNames: [String] = ["cow", "elephant", "chick", "panda", "pig"]
    
    // MARK: - Private Properties
    @Published private var multiplicationTable: CalculationTable<String> = MultiplicationGame.createMultiplicationTable()
    
    private static func createMultiplicationTable() -> CalculationTable<String> {
        return CalculationTable(numberOfQuestionsEnum: .five, highestNumber: 5, displayContentArray: animalNames) { left, right in
            left * right
        }
    }
    
    
    // MARK: - Public Methods - User Intent
    
    func colorSelected(color: FavoriteColor) {
        multiplicationTable.colorTapped(color: color)
    }
    
    func animalSelected(animalName: String) {
        multiplicationTable.displayItemTapped(of: animalName)
    }
    
}
