//
//  ResultAnswers.swift
//  AnimalMath
//
//  Created by Markus Seidler on 2/10/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

struct ResultReply {
    let resultCorrect: Bool
    var reply: String = ""
    
    init(resultCorrect: Bool) {
        self.resultCorrect = resultCorrect
        self.reply = createResultReply()
        
    }
    
    private let correctAnswerReply: [String] = [
        "Well done!!!",
        "Congratulations!",
        "You are a Math talent!",
        "There is a hidden potential.",
        "Awesome!!!",
        "Super, super!",
        "Do you believe that?",
        "Keep it up!",
        ":) :) :)",
        "Best student in class."]
    
    private let wrongAnswerReply: [String] = [
        "Sorry...",
        "Maybe the next one is right.",
        "Don't give up!",
        "Keep trying it!",
        "Practice creates masters",
        "Are you still sleeping?",
        "Wake up, wake up!",
        "Did you hate Math in school?",
        "My 2y old knew the answer.",
        "Did you know dogs can count?"]
    
    private func createResultReply() -> String {
        if resultCorrect {
            let randomIndex = Int.random(in: 0..<correctAnswerReply.count)
            return correctAnswerReply[randomIndex]
        } else {
            let randomIndex = Int.random(in: 0..<wrongAnswerReply.count)
            return wrongAnswerReply[randomIndex]
        }
    }
}

