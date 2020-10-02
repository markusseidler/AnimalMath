//
//  QuestionsCountView.swift
//  AnimalMath
//
//  Created by Markus Seidler on 2/10/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

struct QuestionsCountView: View {
    let paddingLeadingTrailing: CGFloat
    let themeColor: Color
    let cornerRadius: CGFloat
    let questionsSeen: Int
    let questionsTotal: Int
    
    init(paddingLeadingTrailing: CGFloat = 20, themeColor: Color, cornerRadius: CGFloat = 20, questionsSeen: Int, questionsTotal: Int) {
        self.paddingLeadingTrailing = paddingLeadingTrailing
        self.themeColor = themeColor
        self.cornerRadius = cornerRadius
        self.questionsSeen = questionsSeen
        self.questionsTotal = questionsTotal
        self.labelName = "Question: \(questionsSeen)/\(questionsTotal)"
    }
    
    // MARK: - View Constant
    
    let frameWidth: CGFloat = 150.0
    let frameHeight: CGFloat = 35.0
    let labelName: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: cornerRadius).fill(Color.offwhite)
            Text(labelName)
                .font(.headline)
                .foregroundColor(themeColor)
            
        }.frame(width: frameWidth, height: frameHeight, alignment: .center)
        .padding(.top, paddingLeadingTrailing)
    }
}

struct QuestionsCountView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsCountView(paddingLeadingTrailing: 10, themeColor: Color.red, cornerRadius: 20, questionsSeen: 3, questionsTotal: 5)
    }
}
