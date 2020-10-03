//
//  LaunchView.swift
//  AnimalMath
//
//  Created by Markus Seidler on 3/10/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

struct LaunchView: View {
    
    // MARK: - View Variables
    
    @StateObject var game = CalculationGame()
    @StateObject var launchViewVM = LaunchViewVM()
    var animalArray: [DisplayItem<String>] {
        launchViewVM.animalModel.animalArray
    }
    var randomIndex: Int {
        launchViewVM.randomInt()
    }
    
    var themeColor: Color {
        game.selectedColor?.color ?? Color.offwhite
    }
    
    // MARK: - View Constants
    let cornerRadius: CGFloat = 20
    let paddingLeadingTrailing: CGFloat = 20
    
    var body: some View {
        VStack {
            HStack {
                LaunchViewImages(display: animalArray[randomIndex])
                Spacer()
                LaunchViewImages(display: animalArray[randomIndex])
                Spacer()
            }
            HStack {
                LaunchViewImages(display: animalArray[randomIndex])
            }
            
            StartLabelView(paddingLeadingTrailing: paddingLeadingTrailing, themeColor: themeColor, cornerRadius: cornerRadius)
                .padding()
            HStack {
                Spacer()
                LaunchViewImages(display: animalArray[randomIndex])
                Spacer()
                LaunchViewImages(display: animalArray[randomIndex])
            }
            
            HStack {
                LaunchViewImages(display: animalArray[randomIndex])
                Spacer()
                LaunchViewImages(display: animalArray[randomIndex])
            }
            
        }
    }
    
//    func getRandomInt() -> Int {
//        launchViewVM.randomInt()
//    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        let lvVM = LaunchViewVM()
        
        LaunchView(launchViewVM: lvVM)
    }
}
