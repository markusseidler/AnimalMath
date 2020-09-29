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

    

    // MARK: - Public methods, User Intent
    
    func selectColor(color: FavoriteColor) {
        colorModel.colorTapped(color: color)
    }
    
    func selectAnimal(animalName: String) {
        animalModel.animalTapped(animal: animalName)
    }
    
    
    func startGame() {
        calculationGame = CalculationTable(numberOfQuestionsEnum: maxNumber, highestNumber: highestNumber, displayContentArray: animalArray, operation: calculationType.asFunction)
    }
    
}
