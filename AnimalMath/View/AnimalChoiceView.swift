//
//  AnimalChoiceView.swift
//  AnimalMath
//
//  Created by Markus Seidler on 19/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

struct AnimalChoiceView: View {
    let animalName: String
    let isTapped: Bool
    
    var body: some View {
        ZStack {
            Image(animalName).resizable().aspectRatio(contentMode: .fit).padding(8)
                
            Circle().stroke(Color.black, lineWidth: isTapped ? lineWidthWhenTapped : 0)

        } .frame(width: frameSize, height: frameSize)
    }
    
    // View constants
    let frameSize: CGFloat = 55
    let lineWidthWhenTapped: CGFloat = 4
}

struct AnimalChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalChoiceView(animalName: "elephant", isTapped: true)
    }
}
