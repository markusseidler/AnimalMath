//
//  MutliplicationGame.swift
//  AnimalMath
//
//  Created by Markus Seidler on 16/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import Foundation

class MultiplicationGame {
    
    var calculationTable: CalculationTable
    
    init() {
        self.calculationTable = CalculationTable(numberOfQuestionsEnum: .five, highestNumber: 5) { left, right in
            left * right
        }
        print(calculationTable.leftSideNumbers)
        print(calculationTable.rightSideNumbers)
        print(calculationTable.calculationResults)
    }
    
    
}
