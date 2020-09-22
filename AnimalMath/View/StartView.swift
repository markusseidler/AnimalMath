//
//  ContentView.swift
//  AnimalMath
//
//  Created by Markus Seidler on 15/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

//https://www.hackingwithswift.com/guide/ios-swiftui/3/3/challenge

import SwiftUI

struct StartView: View {
    
    // MARK: - View Variables
    
    @ObservedObject var game = MultiplicationGame()
    @State private var stepperTest: Int = 6
    @State private var showGameView = false
    
    var themeColor: Color {
        game.selectedColor?.color ?? Color.offwhite
    }
    
    
    // MARK: - View Constants
    let cornerRadius: CGFloat = 20
    let paddingLeadingTrailing: CGFloat = 20
    let viewPadding: CGFloat = 10
    
    var body: some View {
         NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.white, themeColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    StartLabelView(paddingLeadingTrailing: paddingLeadingTrailing, themeColor: themeColor, cornerRadius: cornerRadius)
                    Spacer()
                    Group {
                        QuestionLabelView(QuestionHeader: .favoriteColor, QuestionCaption: .chooseAndTap)
                        
                        ColorChoiceHstack(game: game)
                            .padding(.bottom, viewPadding)
                    }
                    Group {
                        QuestionLabelView(QuestionHeader: .favoriteAnimal, QuestionCaption: .chooseAndTap)
                        AnimalChoiceHstack(game: game)
                            .padding(.bottom, viewPadding)
                    }
                    Group {
                        QuestionLabelView(QuestionHeader: .lengthOfPlay, QuestionCaption: .amountOfQuestions)
                        Picker(selection: $game.maxNumber, label: Text("")){
                            ForEach(NumberOfQuestionsSet.allCases, id: \.self) { amountString in Text("\(amountString.rawValue)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.leading, paddingLeadingTrailing)
                        .padding(.trailing, paddingLeadingTrailing)
                        .padding(.bottom, viewPadding)
                    }
                    
                    Group {
                        QuestionLabelView(QuestionHeader: .challengeDegree, QuestionCaption: .chooseAndStep)
                        Stepper("Highest number:           \(stepperTest)", value: $stepperTest , in: 1...12).padding(.leading, paddingLeadingTrailing).padding(.trailing, paddingLeadingTrailing)
                    }
                    Spacer()
                    StartGameButton(buttonAction: startGameButtonTapped, accentColorButton: game.selectedColor?.color ?? Color.black, cornerRadius: cornerRadius)
                        .padding(.bottom, paddingLeadingTrailing).sheet(isPresented: $showGameView) {
                            GameView()
                        }
                    
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
         }
    }
    
    private func startGameButtonTapped() {
        game.highestNumber = stepperTest
        game.startGame()
        showGameView = true
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
