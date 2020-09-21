//
//  GameSettings.swift
//  AnimalMath
//
//  Created by Markus Seidler on 21/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import Foundation

class GameSettings: ObservableObject {
    @Published var numberOfQuestions: NumberOfQuestionsSet = .five
    @Published var highestCalculationInput: Int = 6
}

