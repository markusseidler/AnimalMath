//
//  MutliplicationGame.swift
//  AnimalMath
//
//  Created by Markus Seidler on 16/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import Foundation

class MultiplicationGame: ObservableObject {
    
    // MARK: - Public properties
    
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
    
    var calculationInput = [String : [DisplayItem<String>]]()
    var calculationOutput: Double?

    static let animalNames: [String] = ["cow", "elephant", "chick", "panda", "dog", "pig"]
    
    init() {
           multiplicationTable = CalculationTable(numberOfQuestionsEnum: maxNumber, highestNumber: highestNumber, displayContentArray: MultiplicationGame.animalNames, operation: { (left, right) -> Double in
               left * right
           })
           
       }
    
    
    // MARK: - Private Properties
    
    @Published private var multiplicationTable: CalculationTable<String>
    
    private var animalNameTapped: String = "panda"
    private var leftAnimalInputArray = [[DisplayItem<String>]]()
    private var rightAnimalInputArray = [[DisplayItem<String>]]()
    private var resultArray = [Double]()
    
    
    // MARK: - Public Methods - User Intent
    
    func colorSelected(color: FavoriteColor) {
        multiplicationTable.colorTapped(color: color)
    }
    
    func selectAnimal(animalName: String) {
        animalNameTapped = animalName
        multiplicationTable.displayItemTapped(of: animalName)
    }
    
    func startGame() {
        multiplicationTable = CalculationTable(numberOfQuestionsEnum: maxNumber, highestNumber: highestNumber, displayContentArray: MultiplicationGame.animalNames, operation: { (left, right) -> Double in
            left * right
        })
        selectAnimal(animalName: animalNameTapped)
        createAnimalInput()
        
    }
    
    func getInputAndOutput() {
        calculationInput["left"] = leftAnimalInputArray.remove(at: 0)
        calculationInput["right"] = rightAnimalInputArray.remove(at: 0)
        calculationOutput = resultArray.remove(at: 0)
//        print(calculationInput)
    }
    

    func createAnimalInput() {
        leftAnimalInputArray = [[DisplayItem<String>]]()
        rightAnimalInputArray = [[DisplayItem<String>]]()
        resultArray = [Double]()
        
        resultArray = multiplicationTable.calculationResults
        
        for leftNumber in multiplicationTable.leftSideNumbers {
            var tempLeftArray = [DisplayItem<String>]()
            
            for _ in 0..<Int(leftNumber) {
                tempLeftArray.append(DisplayItem<String>(content: animalNameTapped))
//                tempLeftArray.append(animalSelected!)
            }
            leftAnimalInputArray.append(contentsOf: [tempLeftArray])
        }
        
        for rightNumber in multiplicationTable.rightSideNumbers {
            var tempRightArray = [DisplayItem<String>]()
            
            for _ in 0..<Int(rightNumber) {
                tempRightArray.append(DisplayItem<String>(content: animalNameTapped))
//                tempRightArray.append(animalSelected!)
            }
            rightAnimalInputArray.append(contentsOf: [tempRightArray])
        }
    }

}
