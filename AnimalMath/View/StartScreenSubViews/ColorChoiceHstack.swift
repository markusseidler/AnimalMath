//
//  ColorChoiceHstack.swift
//  AnimalMath
//
//  Created by Markus Seidler on 21/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

struct ColorChoiceHstack: View {
//    @EnvironmentObject var game: MultiplicationGame
    @ObservedObject var game = MultiplicationGame()
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(game.colorArray) { favColor in
                ColorChoiceView(color: favColor.color, isTapped: favColor.isSelected)
                    .onTapGesture {
                        self.game.colorSelected(color: favColor)
                }.accessibility(identifier: "ColorView")
                
            }
        }
    }
}
