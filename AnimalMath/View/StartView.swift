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
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .offwhite]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                Text("Animal Math").font(.largeTitle)
                Spacer()
                
                Text("What is your favorite color?")
                    .font(.headline)
                    .padding()
                Text("Choose and tap").font(.caption)
                
                HStack {
                    ForEach(game.colorArray) { favColor in
                        ColorChoiceView(color: favColor.color, isTapped: favColor.isSelected).onTapGesture {
                            self.game.colorSelected(color: favColor)
                        }
                        
                    }
                }
//
//                HStack(alignment: .center) {
//                    ForEach(game.colorArray, id: \.self) { favColor in
//                        ColorChoiceView(color: favColor.color, isTapped: favColor.isSelected)
////
////                        }
////                    }
//                }
//                .padding(.leading, 20)
//                .padding(.trailing, 20)
                
                Spacer()
                
            }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
