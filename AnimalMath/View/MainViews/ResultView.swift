//
//  ResultView.swift
//  AnimalMath
//
//  Created by Markus Seidler on 2/10/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

struct ResultView: View {
    @StateObject var game: CalculationGame
    
    let imageString: String
    let score: Int
    
    var themeColor: Color {
        game.selectedColor?.color ?? Color.offwhite
    }
    
    var body: some View {
            GeometryReader { geometry in
                ZStack{
                    Color.white
                        .edgesIgnoringSafeArea(.all)
                    VStack (spacing: 30) {
                        Text("Your final score is").padding()
                            .font(.largeTitle)
                        ZStack {
                            Circle().fill(Color.offwhite).frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            Text("\(score)").font(.largeTitle)
                        }
                        Image(imageString).resizable().aspectRatio(contentMode: .fit).frame(width: geometry.size.width * 0.6, height: geometry.size.height * 0.40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                            CustomButton(buttonText: "New Game", buttonSystemImageName: "gamecontroller.fill", accentColor: themeColor, backgroundColor: Color.offwhite, buttonAction: dismissResultViewAction)
                                .padding(.bottom, 40)
                        
                    }
                    .foregroundColor(themeColor)
                    
                }
        }
    }
    
    func dismissResultViewAction() {
      print("dismiss")
    
    }
}

struct ResultView_Previews: PreviewProvider {
    
    @State static var presentSheet = false
    
    static var previews: some View {
        
        let game = CalculationGame()
        game.selectColor(color: game.colorArray.first!)
        return ResultView(game: game, imageString: "average", score: 10)
    }
}
