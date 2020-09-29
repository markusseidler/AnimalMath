//
//  AnimalModel.swift
//  AnimalMath
//
//  Created by Markus Seidler on 29/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

struct AnimalModel {
    var animalArray: [DisplayItem<String>] = [
        DisplayItem<String>(content: "cow"),
        DisplayItem<String>(content: "elephant"),
        DisplayItem<String>(content: "chick"),
        DisplayItem<String>(content: "panda", isSelected: false),
        DisplayItem<String>(content: "dog"),
        DisplayItem<String>(content: "pig")
    ]
   
    var animalSelected: DisplayItem<String>? {
        animalArray.first { $0.isSelected }
    }
    
    mutating func animalTapped(animal: String) {
        
        guard let tappedIndex = animalArray.firstIndex(where: { $0.content == animal }) else { return }
        
        if animalSelected == nil {
            animalArray[tappedIndex].isSelected = true
        } else if animalArray.filter({ $0.isSelected }).count == 1 {
            self.animalArray[tappedIndex].isSelected = false
        }        
    }
    
}


