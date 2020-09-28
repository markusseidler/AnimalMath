//
//  ColorModel.swift
//  AnimalMath
//
//  Created by Markus Seidler on 28/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import Foundation

struct ColorModel {
    var colorArray: [FavoriteColor] = [
    FavoriteColor(color: .yellow),
    FavoriteColor(color: .orange),
    FavoriteColor(color: .red),
    FavoriteColor(color: .purple),
    FavoriteColor(color: .blue),
    FavoriteColor(color: .green),
    FavoriteColor(color: .gray)]

    var colorSelected: FavoriteColor? {
        get {
            colorArray.first { (color) -> Bool in
                color.isSelected
            }
        }
    }
    
    mutating func colorTapped(color: FavoriteColor) {
        
        let countTapped = self.colorArray.filter { (favColor) -> Bool in
            favColor.isSelected
        }.count
        
        if let tappedIndex = self.colorArray.firstIndex(of: color) {
            let isTapped = self.colorArray[tappedIndex].isSelected
            if isTapped {
                self.colorArray[tappedIndex].isSelected = false
            } else if !isTapped && countTapped == 0 {
                self.colorArray[tappedIndex].isSelected = true
            }
        }
    }
    


}



