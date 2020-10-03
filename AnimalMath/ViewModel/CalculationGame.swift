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
    var questionsLeft: Int {
        resultArray.count
    }
    var questionsSeen: Int {
        questionsOriginallySelected - questionsLeft
    }
    
    var questionsOriginallySelected: Int = 0
    
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
    
    private let animalDefault = "panda"


    // MARK: - Public methods, User Intent
    
    func selectColor(color: FavoriteColor) {
        colorModel.colorTapped(color: color)
    }
    
    func selectAnimal(animalName: String) {
        animalModel.animalTapped(animal: animalName)
    }
    
    func startGame() {
        if animalSelected == nil {
            selectAnimal(animalName: animalDefault)
        }
        calculationGame = CalculationTable(numberOfQuestionsEnum: maxNumber, highestNumber: highestNumber, displayContentArray: animalArray, operation: calculationType.asFunction)
        
        createAnimalInput()
    }
    
    func getInputAndOutputArray() {
        calculationInput["left"] = leftAnimalInputArray.remove(at: 0)
        calculationInput["right"] = rightAnimalInputArray.remove(at: 0)
        calculationOutput = resultArray.remove(at: 0)
    }
    
    func showUnsecureMessage() -> Bool {
        let randomBool = RandomBool()
        return randomBool.boolResult
    }
    
    func scoreRanking(score: Int) -> String {
        let relativeScore = Double(score / questionsOriginallySelected)
        
        switch relativeScore {
        case ..<0:
            return ResultImageStrings.weak.rawValue
        case 0..<0.5:
            return ResultImageStrings.average.rawValue
        case 0.5..<0.9:
            return ResultImageStrings.good.rawValue
        default:
            return ResultImageStrings.perfect.rawValue
        }
        
    }
    
    
    // MARK: - Private methods
    
    private func createAnimalInput() {
                
        guard let results = calculationGame?.calculationResults else { return }
        guard let leftSideNumbers = calculationGame?.leftSideNumbers else { return }
        guard let rightSideNumbers = calculationGame?.rightSideNumbers else { return }
        
        resultArray = results
        questionsOriginallySelected = results.count
        leftAnimalInputArray = loopingThroughInputArray(numberInputArray: leftSideNumbers)
        rightAnimalInputArray = loopingThroughInputArray(numberInputArray: rightSideNumbers)
        
    }
    
    private func loopingThroughInputArray(numberInputArray: [Double]) -> [[DisplayItem<String>]] {
        var contentInputArray = [[DisplayItem<String>]]()
        for number in numberInputArray {
            var tempArray = [DisplayItem<String>]()
            for _ in 0..<Int(number) {
                tempArray.append(DisplayItem<String>(content: animalSelected?.content ?? animalDefault))
            }
            
            contentInputArray.append(tempArray)
        }
        
        return contentInputArray
    }
}

struct CalculationGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
