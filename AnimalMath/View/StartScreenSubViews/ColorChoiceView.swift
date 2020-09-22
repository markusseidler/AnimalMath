//
//  ColorChoiceView.swift
//  AnimalMath
//
//  Created by Markus Seidler on 16/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

struct ColorChoiceView: View {
    
    let color: Color
    let isTapped: Bool
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: circleSize, height: circleSize)
            .overlay(Circle().stroke(Color.black, lineWidth: isTapped ? lineWidthWhenTapped : 0))
    }
    
    // View constants
    let circleSize: CGFloat = 40
    let lineWidthWhenTapped: CGFloat = 4
}

struct ColorChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        ColorChoiceView(color: Color.red, isTapped: true)
    }
}
