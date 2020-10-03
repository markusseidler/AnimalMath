//
//  LaunchViewVM.swift
//  AnimalMath
//
//  Created by Markus Seidler on 3/10/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import Foundation

class LaunchViewVM: ObservableObject {
    
    let animalModel: AnimalModel
    
    init() {
        animalModel = AnimalModel()
    }
    
    func randomInt() -> Int {
        return Int.random(in: 0..<animalModel.animalArray.count)
    }
  
    
    
}
