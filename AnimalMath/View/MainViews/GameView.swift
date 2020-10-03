//
//  GameView.swift
//  AnimalMath
//
//  Created by Markus Seidler on 22/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

//https://www.simpleswiftguide.com/how-to-present-new-sheet-view-from-navigationbaritems-button-in-swiftui/
//
//https://www.hackingwithswift.com/quick-start/swiftui/how-to-position-views-in-a-grid-using-lazyvgrid-and-lazyhgrid


// TODO: - What happen if you dismiss modal view sheet? -> change that it starts new GameView... Create Launch Screen with color selection... create AppIcons... add ANIMATIONS!


@available(iOS 14.0, *)

enum ActiveAlert {
    case unsecureReplyAlert, resultReplyAlert
}

struct GameView: View {
    
    // MARK: - View Variables
    
    @StateObject var game: CalculationGame
    @State private var signed: String = "+"
    @State private var digitOne: Int = 0
    @State private var digitTwo: Int = 0
    @State private var digitThree: Int = 0
    
    @State private var score: Int = 0
    
    @State private var presentAlert: Bool = false
    @State private var presentSheet: Bool = false
    @State private var activeAlert: ActiveAlert = .unsecureReplyAlert
    @State private var guessIsCorrect: Bool = false
    
    private var selectedNumber: Double {
        let selection: Double
        selection = Double(digitOne * 100 + digitTwo * 10 + digitThree)
        if signed == "-" {
            return (selection * -1)
        } else {
            return selection
        }
    }
    
    
    // MARK: - View Constants
    
//    static let columnSpacing: CGFloat = 10.0
    static let gridSpacing: CGFloat = 8.0
    static let gridItemMinSize: CGFloat = 30
    static let gridItemMaxSize: CGFloat = 1000
    
    let cornerRadius: CGFloat = 50
    
    var themeColor: Color {
        game.selectedColor?.color ?? Color.offwhite
    }
    
    var rows = [
        GridItem(.adaptive(minimum: gridItemMinSize, maximum: gridItemMaxSize), alignment: .center),
        GridItem(.adaptive(minimum: gridItemMinSize, maximum: gridItemMaxSize), alignment: .center),
        GridItem(.adaptive(minimum: gridItemMinSize, maximum: gridItemMaxSize), alignment: .center)
    ]
    
    var body: some View {
        
        ZStack{
            RadialGradient(gradient: Gradient(colors: [.white, themeColor]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 600)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    QuestionsCountView(themeColor: themeColor, questionsSeen: game.questionsSeen, questionsTotal: game.questionsOriginallySelected)
                    ScoreLabelView(themeColor: themeColor, score: score)
                    
                }
                
                QuestionView(themeColor: themeColor, label: .howMuchIs, coloredLabel: true)
                    .padding(.bottom, 5)
    

                if let leftInputArray = game.calculationInput["left"] {
                    LazyHGrid(rows: rows, alignment: .center, spacing: GameView.gridSpacing) {
                        ForEach(leftInputArray) { input in
                            Image(input.content)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                }

                QuestionView(themeColor: themeColor, label: game.calculationType.asQuestionLabel, coloredLabel: false)
                    .padding(.bottom, 5)
    

                if let rightInputArray = game.calculationInput["right"] {
                    LazyHGrid(rows: rows, alignment: .center, spacing: GameView.gridSpacing) {
                        ForEach(rightInputArray) { input in
                            Image(input.content).resizable().aspectRatio(contentMode: .fit)
                        }
                    }
                }

                VStack(spacing: 0) {
                    QuestionView(themeColor: themeColor, label: .yourGuess, coloredLabel: true)
                        .padding()
                    
                    HStack(spacing: 10) {
               
                        
                        ResultPickerView(signed: $signed, digitOne: $digitOne, digitTwo: $digitTwo, digitThree: $digitThree)
                            .padding(.horizontal, 10)
                        
                        CustomButton(buttonText: "Submit", buttonSystemImageName: "checkmark.circle.fill", accentColor: game.selectedColor?.color ?? Color.black, backgroundColor: Color.white, buttonAction: submitButtonPressed)
                        
//                        SubmitButton(buttonAction: submitButtonPressed, accentColorButton: game.selectedColor?.color ?? Color.black, cornerRadius: cornerRadius)
                    }
                }
                .padding(.bottom, 30)
            }
           
        }
        .alert(isPresented: $presentAlert) {
            switch activeAlert {
            case .unsecureReplyAlert:
                return Alert(title: Text("Wait!"), message: Text(UnsecureReply().reply), primaryButton: .destructive(Text("Still submit")) {
                                DispatchQueue.main.async {
                                    submitResult()}},
                             secondaryButton: .cancel())
            case .resultReplyAlert:
                return Alert(title: Text("\(guessIsCorrect ? "Correct!" : "Wrong")"), message: Text(ResultReply(resultCorrect: guessIsCorrect).reply), dismissButton: .default(Text(game.questionsLeft==0 ? "Game over" : "Next question"), action: { afterDismissAction() })
                )
            }
        }
        .sheet(isPresented: $presentSheet) {ResultView(game: game, imageString: game.scoreRanking(score: score), score: score)}
        .navigationBarTitle("Animal Math", displayMode: .inline)
        .navigationBarHidden(false)

    }
    
    private func submitButtonPressed() {
        
        if game.showUnsecureMessage() {
            activeAlert = .unsecureReplyAlert
            presentAlert = true
        } else {
            activeAlert = .resultReplyAlert
            submitResult()
        }
    }
    
    private func submitResult() {
        presentAlert = false
        activeAlert = .resultReplyAlert
        guessIsCorrect = selectedNumber == game.calculationOutput
        presentAlert = true
        if guessIsCorrect {
            score += 1
        } else {
            score -= 1
        }
    }
    
    private func afterDismissAction() {
        if game.questionsLeft != 0 {
            game.getInputAndOutputArray()
        } else {
            presentSheet = true
        }
    }

    
}
 
struct GameView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        let game = CalculationGame()

        game.startGame()
        game.getInputAndOutputArray()
        
        
        game.selectColor(color: game.colorArray.first!)
        return GameView(game: game)
    }
}
