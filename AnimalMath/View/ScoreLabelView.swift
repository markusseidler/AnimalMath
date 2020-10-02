//
//  ScoreLabelView.swift
//  AnimalMath
//
//  Created by Markus Seidler on 1/10/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

struct ScoreLabelView: View {
    let paddingLeadingTrailing: CGFloat
    let themeColor: Color
    let cornerRadius: CGFloat
    let score: Int
    
    init(paddingLeadingTrailing: CGFloat = 20, themeColor: Color, cornerRadius: CGFloat = 20, score: Int = 0) {
        self.paddingLeadingTrailing = paddingLeadingTrailing
        self.themeColor = themeColor
        self.cornerRadius = cornerRadius
        self.score = score
        self.labelName = "Your score: \(score)"
    }
    
    // MARK: - View Constant
    
    let frameWidth: CGFloat = 250.0
    let frameHeight: CGFloat = 35.0
    let labelName: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: cornerRadius).fill(themeColor)
            Text(labelName)
                .font(.headline)
            
        }.frame(width: frameWidth, height: frameHeight, alignment: .center)
        .padding(.top, paddingLeadingTrailing)
    }
    
}

struct ScoreLabelView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreLabelView(paddingLeadingTrailing: 10, themeColor: Color.red, cornerRadius: 20, score: 10)
    }
}
