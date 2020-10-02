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


// TODO: - Create Score Field and then check of results and continue Game loop and check labels.. in field with rounded rectangles, change accentcolor for backbutton and change text muliplied with switch statement.... launch screen with title AnimalMath for one second? with color checkin launch screen...


@available(iOS 14.0, *)
struct GameView: View {
    
    // MARK: - View Variables
    
    @StateObject var game: CalculationGame
    @State var signed: String = "+"
    @State var digitOne: Int = 0
    @State var digitTwo: Int = 0
    @State var digitThree: Int = 0
    
    @State var score: Int = 0
    
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
                ScoreLabelView(themeColor: themeColor, score: score)
                
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
                        
                        SubmitButton(buttonAction: submitButtonPressed, accentColorButton: game.selectedColor?.color ?? Color.black, cornerRadius: cornerRadius)
                    }
                }
                .padding(.bottom, 30)
                
                
            }
           
        }

        .navigationBarTitle("Animal Math", displayMode: .inline)
        .navigationBarHidden(false)

    }
    
    private func submitButtonPressed() {
        print("pressed")
        if selectedNumber == game.calculationOutput {
            print("it is correct")
        } else {
            print("not correct")
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
