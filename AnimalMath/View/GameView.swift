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

// Fix ForEach with left and right input... maybe split it into two arrays? 

@available(iOS 14.0, *)
struct GameView: View {
    
//    @ObservedObject var game = MultiplicationGame()
    @EnvironmentObject var game: MultiplicationGame
    
    let rows = GridItem(.adaptive(minimum: 80, maximum: 200), spacing: 5, alignment: .center)
    
    var body: some View {
        
        VStack {
            QuestionLabelView(QuestionHeader: .howMuchIs, QuestionCaption: nil)
            
            if let leftInputArray = game.calculationInput["left"] {
                LazyHGrid(rows: [rows], alignment: .center, spacing: 5) {
//                    ForEach(0..<leftInputArray.count) { _ in
//                        Image("cow").id(UUID())
//                    }
                    
                    // ID is exactly the same???
                    
                    ForEach(leftInputArray, id: \.self) { input in
                        Text("hallo").id(UUID())
                    }
                }
                
//                LazyHGrid(rows: [rows]) {
//                    ForEach(0..<100) { _ in
//                        Text("Hallo")
//                    }
//                }
                
            }
            
        }.onAppear(perform: schauMaMal)
        
    }
    
    func schauMaMal() {
        print("left array: \n \(game.calculationInput["left"])" ?? "links ist leer")
        print("right array: \n \(game.calculationInput["right"])" ?? "rechts ist leer")
        print("alles array: \n \(game.calculationInput)" ?? "alles ist leer")
    }
}

@available(iOS 14.0, *)
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
