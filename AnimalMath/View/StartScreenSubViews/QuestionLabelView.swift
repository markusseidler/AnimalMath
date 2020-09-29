//
//  QuestionLabelView.swift
//  AnimalMath
//
//  Created by Markus Seidler on 22/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

enum QuestionLabels: String {
    case favoriteColor = "What is your favorite color?"
    case favoriteAnimal = "What is your favorite animal?"
    case lengthOfPlay = "How long do you want to play?"
    case challengeDegree = "How challenging should it be?"
    case chooseAndTap = "Choose and tap"
    case chooseAndStep = "Choose and step"
    case amountOfQuestions = "Amount of Questions"
    case whichCalculationType = "What should we play?"
    case calculationType = "Calculation Type"
    
    case howMuchIs = "How much is?"
    case multiplied = "multiplied by"
}

struct QuestionLabelView: View {
    let QuestionHeader: QuestionLabels
    let QuestionCaption: QuestionLabels?
    
    var body: some View {
        VStack {
            Text(QuestionHeader.rawValue)
                .font(.headline)
                .padding(.bottom, 1)
                .padding(.top, 5)
            Text(QuestionCaption?.rawValue ?? "")
                .font(.caption)
        }
    }
}

struct QuestionLabelView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionLabelView(QuestionHeader: .favoriteColor, QuestionCaption: .chooseAndTap)
    }
}
