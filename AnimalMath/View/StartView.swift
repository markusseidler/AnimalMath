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
    
//    var fontColor: Color {
//        game.selectedColor?.color ?? Color.black
//    }
    
    
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
                    
                    
                    Text("What is your favorite color?")
                        .font(.headline)
                        .padding()
                    Text("Choose and tap").font(.caption)
                    
                    HStack(spacing: 10) {
                        ForEach(game.colorArray) { favColor in
                            ColorChoiceView(color: favColor.color, isTapped: favColor.isSelected)
                                .onTapGesture {
                                self.game.colorSelected(color: favColor)
                            }.accessibility(identifier: "ColorView")
                            
                        }
                    }
                    
                    
                    Text("What is your favorite animal?")
                        .font(.headline)
                        .padding()
                    Text("Choose and tap").font(.caption)
                    
                    HStack(spacing: 10) {
                        ForEach(game.animalArray) { animal in
                            AnimalChoiceView(animalName: animal.content, isTapped: animal.isSelected)
                                .onTapGesture {
                                    self.game.animalSelected(animalName: animal.content)
                            }
                        }
                        .accessibility(identifier: "AnimalView")
                    }
                    
                    Spacer()
                    
                }
                
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
