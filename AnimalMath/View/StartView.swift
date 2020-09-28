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
    
//    @ObservedObject var game = MultiplicationGame()
    @EnvironmentObject var game: MultiplicationGame
    @State private var stepperTest: Int = 6
    @State private var showGameView = false
    
    var themeColor: Color {
        game.selectedColor?.color ?? Color.offwhite
    }
    
    
    // MARK: - View Constants
    let cornerRadius: CGFloat = 20
    let paddingLeadingTrailing: CGFloat = 20
    let viewPadding: CGFloat = 3
    
    var body: some View {
         NavigationView {
            ZStack {
                RadialGradient(gradient: Gradient(colors: [.white, themeColor]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/, endRadius: 1000)
//                LinearGradient(gradient: Gradient(colors: [.white, themeColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    StartLabelView(paddingLeadingTrailing: paddingLeadingTrailing, themeColor: themeColor, cornerRadius: cornerRadius)
                    Spacer()
                    Group {
                        QuestionLabelView(QuestionHeader: .favoriteColor, QuestionCaption: .chooseAndTap)
                        
                        ColorChoiceHstack()
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
                    
                    if #available(iOS 14.0, *) {
                        NavigationLink(
                            destination: GameView(),
                            isActive: $showGameView) {
                            
                            
                            StartGameButton(buttonAction: startGameButtonTapped, accentColorButton: game.selectedColor?.color ?? Color.black, cornerRadius: cornerRadius)
                                .padding(.bottom, paddingLeadingTrailing)
                            
                        }
                    } else {
                        // Fallback on earlier versions
                    }
                }
            }
            .navigationBarTitle("New Game")
            .navigationBarHidden(true)
         }
    }
    
    private func startGameButtonTapped() {
        game.highestNumber = stepperTest
        game.startGame()
        showGameView = true
        game.createAnimalInput()
        game.getInputAndOutput()
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = MultiplicationGame()
        let startView = StartView()
        
        let iPhone11 = "iPhone 11"
        let iPhone8 = "iPhone 8"
        let iPhoneSE = "iPhone SE (2nd generation)"
        let iPadAir = "iPad Air (4th generation)"
        
        
        return Group {
            startView.environmentObject(game).previewDevice( PreviewDevice(rawValue: iPhone11)).previewDisplayName(iPhone11)
            startView.environmentObject(game).previewDevice(PreviewDevice(rawValue: iPhone8)).previewDisplayName(iPhone8)
//            startView.environmentObject(game).previewDevice(PreviewDevice(rawValue: iPhoneSE)).previewDisplayName(iPhoneSE)
            startView.environmentObject(game).previewDevice(PreviewDevice(rawValue: iPadAir)).previewDisplayName(iPadAir)

        }
    }
}
