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



@available(iOS 14.0, *)
struct GameView: View {
    
    @EnvironmentObject var game: MultiplicationGame
    
    // MARK: - View Constants
    
//    static let columnSpacing: CGFloat = 10.0
    static let gridSpacing: CGFloat = 5.0
    static let gridPadding: CGFloat = 0.0
    static let gridItemMinSize: CGFloat = 30
    static let gridItemMaxSize: CGFloat = 1000
    
    var rows = [
        GridItem(.adaptive(minimum: gridItemMinSize, maximum: gridItemMaxSize), alignment: .center),
        GridItem(.adaptive(minimum: gridItemMinSize, maximum: gridItemMaxSize), alignment: .center),
        GridItem(.adaptive(minimum: gridItemMinSize, maximum: gridItemMaxSize), alignment: .center)
    ]
    
    var body: some View {
        
        VStack {
            QuestionLabelView(QuestionHeader: .howMuchIs, QuestionCaption: nil)
                .padding()
            
            if let leftInputArray = game.calculationInput["left"] {
                LazyHGrid(rows: rows, alignment: .center, spacing: GameView.gridSpacing) {
                    ForEach(leftInputArray) { input in
                        Image(input.content)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
            }
            
            Text(QuestionLabels.multiplied.rawValue)
                .padding()
            
            if let rightInputArray = game.calculationInput["right"] {
                LazyHGrid(rows: rows, alignment: .center, spacing: GameView.gridSpacing) {
                    ForEach(rightInputArray) { input in
                        Image(input.content).resizable().aspectRatio(contentMode: .fit)
                    }
                }
            }
            
            Text("Score")
            
            Spacer()
            
        }.onAppear(perform: schauMaMal)
        
    }
    
    func schauMaMal() {
        print("left array: \n \(game.calculationInput["left"]?.count)" ?? "links ist leer")
        print("right array: \n \(game.calculationInput["right"]?.count)" ?? "rechts ist leer")
//        print("alles array: \n \(game.calculationInput)" ?? "alles ist leer")
    }
}

@available(iOS 14.0, *)
struct GameView_Previews: PreviewProvider {


    static var previews: some View {
        
        let game = MultiplicationGame()
        let animalName = "chick"
        let amountItems = 12
        
        let iPhone11 = "iPhone 11"
        let iPhone8 = "iPhone 8"
        let iPadAir = "iPad Air (4th generation)"
        
        game.calculationInput["left"] = addItems(amount: amountItems, animalName: animalName)
        game.calculationInput["right"] = addItems(amount: amountItems, animalName: animalName)

        return Group {
            GameView().environmentObject(game).previewDevice( PreviewDevice(rawValue: iPhone11)).previewDisplayName(iPhone11)
            GameView().environmentObject(game).previewDevice(PreviewDevice(rawValue: iPhone8)).previewDisplayName(iPhone8)
            GameView().environmentObject(game).previewDevice(PreviewDevice(rawValue: iPadAir)).previewDisplayName(iPadAir)

        }
    }
    
    static func addItems(amount: Int, animalName: String) -> [DisplayItem<String>] {
        var arrayInput = [DisplayItem<String>]()
        
        for _ in 0..<amount{
            arrayInput.append(DisplayItem<String>(content: animalName))
        }
    
        
        return arrayInput
    }
}
