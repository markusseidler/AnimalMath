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
    
    // MARK: - Private Properties
    @Published private var multiplicationTable: CalculationTable = MultiplicationGame.createMultiplicationTable()
    
    private static func createMultiplicationTable() -> CalculationTable {
        return CalculationTable(numberOfQuestionsEnum: .five, highestNumber: 5) { left, right in
            left * right
        }
    }
    
    
    // MARK: - Public Methods - User Intent
    
    func colorSelected(color: FavoriteColor) {
        multiplicationTable.colorTapped(color: color)
    }
    
}
