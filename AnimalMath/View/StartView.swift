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
    
    @State private var stepperTest: Int = 1
    
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.white, themeColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).fill(themeColor)
                        Text("Animal Math")
                        .font(.largeTitle)
                        
                    }.frame(width: 250, height: 50, alignment: .center)
                    
                    
                    Group {
                        Text("What is your favourite color?")
                            .font(.headline)
                            .padding()
                        Text("Choose and tap").font(.caption)
                    }
                    
                    HStack(spacing: 10) {
                        ForEach(game.colorArray) { favColor in
                            ColorChoiceView(color: favColor.color, isTapped: favColor.isSelected)
                                .onTapGesture {
                                self.game.colorSelected(color: favColor)
                            }.accessibility(identifier: "ColorView")
                            
                        }
                    }
                    
                    
                    Group {
                        Text("What is your favourite animal?")
                            .font(.headline)
                            .padding()
                        Text("Choose and tap").font(.caption)
                    }
                    
                    HStack(spacing: 10) {
                        ForEach(game.animalArray) { animal in
                            AnimalChoiceView(animalName: animal.content, isTapped: animal.isSelected)
                                .onTapGesture {
                                    self.game.animalSelected(animalName: animal.content)
                            }
                        }
                        .accessibility(identifier: "AnimalView")
                    }
                    
                    Group {
                        
                        Text("How long do you want to play? ")
                            .font(.headline)
                            .padding()
                        Text("Choose and step").font(.caption)
                        
                        Stepper("Number of questions:         \(stepperTest)", value: $stepperTest, in: 1...12).padding(.leading, 20).padding(.trailing, 20)
                        
                    }
                    
                    Group {
                        
                        Text("How difficult should be? ")
                            .font(.headline)
                            .padding()
                        Text("Choose and step").font(.caption)
                        
                        Stepper("Highest number:                  \(stepperTest)", value: $stepperTest, in: 1...12).padding(.leading, 20).padding(.trailing, 20)
                        
                    }
                    
                    Button(action: testFunction) {
                        Text("Start Game")
                    }
                    
                    Spacer()
                    
                }
                
            }
        }
    }
    
    func testFunction() {
        print("test")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
