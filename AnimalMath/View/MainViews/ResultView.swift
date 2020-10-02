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
                VStack {
                    Text("Game completed!")
                        .padding().font(.largeTitle)
                    Text("Your final score is").padding()
                        .font(.largeTitle)
                    Text("\(score)").font(.largeTitle)
                    Image(imageString).resizable().aspectRatio(contentMode: .fit).frame(width: geometry.size.width * 0.75, height: geometry.size.height * 0.50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                .foregroundColor(themeColor)
                
            }
        }
        
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        let game = CalculationGame()
        game.selectColor(color: game.colorArray.first!)
        return ResultView(game: game, imageString: "average", score: 10)
    }
}
