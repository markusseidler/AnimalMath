//
//  CalculationGame.swift
//  AnimalMath
//
//  Created by Markus Seidler on 29/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

class CalculationGame: ObservableObject {
    
    // MARK: - Public properties
    
    @Published var maxNumber: NumberOfQuestionsSet
    @Published var highestNumber: Int
    
    var colorArray: [FavoriteColor] { colorModel.colorArray }
    var selectedColor: FavoriteColor? { colorModel.colorSelected }
      
    var animalArray: [DisplayItem<String>] { animalModel.animalArray }
    var animalSelected: DisplayItem<String>? { animalModel.animalSelected}
    
    var calculationType: CalculationTypes
    var calculationInput = [String : [DisplayItem<String>]]()
    var calculationOutput: Double? 
    
    init() {
        self.colorModel = ColorModel()
        self.animalModel = AnimalModel()
        self.maxNumber = .five
        self.highestNumber = 6
        self.calculationType = .addition
    }
    
    // MARK: - Private properties
    
    @Published private var calculationGame: CalculationTable<String>?
    @Published private var colorModel: ColorModel
    @Published private var animalModel: AnimalModel
    
    private var leftAnimalInputArray = [[DisplayItem<String>]]()
    private var rightAnimalInputArray = [[DisplayItem<String>]]()
    private var resultArray = [Double]()


    // MARK: - Public methods, User Intent
    
    func selectColor(color: FavoriteColor) {
        colorModel.colorTapped(color: color)
    }
    
    func selectAnimal(animalName: String) {
        animalModel.animalTapped(animal: animalName)
    }
    
    func startGame() {
        if animalSelected == nil {
            selectAnimal(animalName: "panda")
        }
        calculationGame = CalculationTable(numberOfQuestionsEnum: maxNumber, highestNumber: highestNumber, displayContentArray: animalArray, operation: calculationType.asFunction)
    }
    
    // MARK: - Private methods
    
    private func createAnimalInput() {
        // is this needed? do I need to clean them before use them again?
//        leftAnimalInputArray = [[DisplayItem<String>]]()
        //        rightAnimalInputArray = [[DisplayItem<String>]]()
        //        resultArray = [Double]()
        
        guard let results = calculationGame?.calculationResults else { return }
        guard let leftSideNumbers = calculationGame?.leftSideNumbers else { return }
        guard let rightSideNumbers = calculationGame?.rightSideNumbers else { return }
        
        resultArray = results
        for leftNumber in leftSideNumbers {
            
        }
        
        
    }
    
    // TODO: implement this... and then work on gameview...
    
    
//    func getInputAndOutput() {
   //        calculationInput["left"] = leftAnimalInputArray.remove(at: 0)
   //        calculationInput["right"] = rightAnimalInputArray.remove(at: 0)
   //        calculationOutput = resultArray.remove(at: 0)
   ////        print(calculationInput)
   //    }
   //
   //
   //    func createAnimalInput() {
   //        leftAnimalInputArray = [[DisplayItem<String>]]()
   //        rightAnimalInputArray = [[DisplayItem<String>]]()
   //        resultArray = [Double]()
   //
   //        resultArray = multiplicationTable.calculationResults
   //
   //        for leftNumber in multiplicationTable.leftSideNumbers {
   //            var tempLeftArray = [DisplayItem<String>]()
   //
   //            for _ in 0..<Int(leftNumber) {
   //                tempLeftArray.append(DisplayItem<String>(content: animalNameTapped))
   ////                tempLeftArray.append(animalSelected!)
   //            }
   //            leftAnimalInputArray.append(contentsOf: [tempLeftArray])
   //        }
   //
   //        for rightNumber in multiplicationTable.rightSideNumbers {
   //            var tempRightArray = [DisplayItem<String>]()
   //
   //            for _ in 0..<Int(rightNumber) {
   //                tempRightArray.append(DisplayItem<String>(content: animalNameTapped))
   ////                tempRightArray.append(animalSelected!)
   //            }
   //            rightAnimalInputArray.append(contentsOf: [tempRightArray])
   //        }
   //    }
   //
    
    
    
}

struct CalculationGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
