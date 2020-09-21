//
//  AnimalChoiceHstack.swift
//  AnimalMath
//
//  Created by Markus Seidler on 21/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

struct AnimalChoiceHstack: View {
    @ObservedObject var game = MultiplicationGame()
    
    var body: some View {
        HStack(spacing: 5) {
            ForEach(game.animalArray) { animal in
                AnimalChoiceView(animalName: animal.content, isTapped: animal.isSelected)
                    .onTapGesture {
                        self.game.animalSelected(animalName: animal.content)
                }
            }
            .accessibility(identifier: "AnimalView")
        }
    }
}

