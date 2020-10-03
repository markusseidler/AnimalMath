//
//  ColorChoiceHstack.swift
//  AnimalMath
//
//  Created by Markus Seidler on 21/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct ColorChoiceHstack: View {
//    @EnvironmentObject var game: MultiplicationGame
    @StateObject var game: CalculationGame
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(game.colorArray) { favColor in
                ColorChoiceView(color: favColor.color, isTapped: favColor.isSelected)
                    .onTapGesture {
                        self.game.selectColor(color: favColor)
                }.accessibility(identifier: "ColorView")
                
            }
        }
    }
}
