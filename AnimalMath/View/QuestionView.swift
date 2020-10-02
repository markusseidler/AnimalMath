//
//  QuestionView.swift
//  AnimalMath
//
//  Created by Markus Seidler on 1/10/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

struct QuestionView: View {
    let paddingLeadingTrailing: CGFloat
    let themeColor: Color
    let cornerRadius: CGFloat
    let coloredLabel: Bool
    let labelName: QuestionLabels

    init(paddingLeadingTrailing: CGFloat = 20, themeColor: Color, cornerRadius: CGFloat = 20, label: QuestionLabels, coloredLabel: Bool) {
        self.paddingLeadingTrailing = paddingLeadingTrailing
        self.themeColor = themeColor
        self.cornerRadius = cornerRadius
        self.labelName = label
        self.coloredLabel = coloredLabel
    }
    
    // MARK: - View Constant
    
    let frameWidth: CGFloat = 250.0
    let frameHeight: CGFloat = 30.0
    let opacityRatio: Double = 0.3
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: cornerRadius).fill(coloredLabel ? themeColor : Color.offwhite).opacity(opacityRatio)
            Text(labelName.rawValue)
                .font(.headline).foregroundColor(coloredLabel ? Color.black : themeColor)
            
        }.frame(width: frameWidth, height: frameHeight, alignment: .center)
        .padding(.top, paddingLeadingTrailing)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(themeColor: Color.blue, label: .howMuchIs, coloredLabel: true)
    }
}
