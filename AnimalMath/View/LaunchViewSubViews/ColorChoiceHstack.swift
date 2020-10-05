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
    @StateObject var game: CalculationGame
    @Binding var nextButtonIsHidden: Bool

    var body: some View {
        HStack(spacing: -3) {
            ForEach(game.colorArray) { favColor in
                ColorChoiceView(color: favColor.color, isTapped: favColor.isSelected)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            self.game.selectColor(color: favColor)
                            self.game.selectedColor != nil ? (nextButtonIsHidden = false) : (nextButtonIsHidden = true)
                        }
                }
                    .accessibility(identifier: "ColorView")
            }
        }.padding(.horizontal, 10)
    }
}
