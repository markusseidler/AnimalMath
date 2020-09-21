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
    
    @ObservedObject var game = MultiplicationGame()
    
    var themeColor: Color {
        game.selectedColor?.color ?? Color.offwhite
    }
    
    @State private var stepperTest: Int = 6
    
    var body: some View {
         NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.white, themeColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ZStack{
                        RoundedRectangle(cornerRadius: cornerRadius).fill(themeColor)
                        Text("Animal Math")
                        .font(.largeTitle)
                        
                        }.frame(width: 250, height: 50, alignment: .center)
                        .padding(.top, paddingLeadingTrailing)
                    
                    Spacer()
                    
                    
                    Group {
                        Text("What is your favourite color?")
                            .font(.headline)
                            .padding()
                        Text("Choose and tap").font(.caption)
                    }
                    
                    ColorChoiceHstack(game: game)
                    
                    
                    Group {
                        Text("What is your favourite animal?")
                            .font(.headline)
                            .padding()
                        Text("Choose and tap").font(.caption)
                    }
                    
                    AnimalChoiceHstack(game: game)
                    
                    Group {
                        
                        Text("How long do you want to play? ")
                            .font(.headline)
                            .padding()
                        Text("Number of Questions").font(.caption)
                        
                        Picker(selection: $game.maxNumber, label: Text("What?")) {
                            ForEach(NumberOfQuestionsSet.allCases, id: \.self) { amountString in Text("\(amountString.asString)")
                                
                            }
                            }.pickerStyle(SegmentedPickerStyle())
                            .padding(.leading, paddingLeadingTrailing)
                            .padding(.trailing, paddingLeadingTrailing)
                        
                    }
                    
                    Group {
                        
                        Text("How difficult should be? ")
                            .font(.headline)
                            .padding()
                        Text("Choose and step").font(.caption)
                        
                        Stepper("Highest number:           \(stepperTest)", value: $stepperTest , in: 1...12).padding(.leading, paddingLeadingTrailing).padding(.trailing, paddingLeadingTrailing)
                        
                    }
                    
                    Spacer()
                    
                    StartGameButton(buttonAction: testFunction, accentColorButton: game.selectedColor?.color ?? Color.black, cornerRadius: cornerRadius)
                        .padding(.bottom, paddingLeadingTrailing)
                    
                    
                }
                
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
    
    func testFunction() {
        game.highestNumber = stepperTest
        game.startGame()
        print(game.calculationResult)
    }
    
    // MARK: - View Constants
    let cornerRadius: CGFloat = 20
    let paddingLeadingTrailing: CGFloat = 20
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

