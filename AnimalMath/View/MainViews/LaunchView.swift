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
    
    @State private var nextButtonIsHidden = true
    
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
    let viewPadding: CGFloat = -1
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [themeColor, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    LaunchViewImages(display: animalArray[randomIndex])
                    Spacer()
                    LaunchViewImages(display: animalArray[randomIndex])
                    Spacer()
                }
                HStack {
                    LaunchViewImages(display: animalArray[randomIndex])
                    LaunchViewImages(display: animalArray[randomIndex])
                    
                }
                
                StartLabelView(themeColor: themeColor, cornerRadius: cornerRadius)
                    .padding()
                HStack {
                    Spacer()
                    LaunchViewImages(display: animalArray[randomIndex])
                    Spacer()
                    LaunchViewImages(display: animalArray[randomIndex])
                    Spacer()
                }
                
                HStack {
                    LaunchViewImages(display: animalArray[randomIndex])
                    Spacer()
                    LaunchViewImages(display: animalArray[randomIndex])
                    Spacer()
                    LaunchViewImages(display: animalArray[randomIndex])
                }
                Spacer()
                Group {
                    QuestionLabelView(QuestionHeader: .favoriteColor, QuestionCaption: .chooseAndTap)
                        .padding(.top, 10)
                    
                    ColorChoiceHstack(game: game, nextButtonIsHidden: $nextButtonIsHidden)
                        .padding(.bottom, viewPadding).onTapGesture(count: 1, perform: {
                            print("test")
                        })
                }
                Spacer()
                HStack {
                    LaunchViewImages(display: animalArray[randomIndex])
                    CustomButton(buttonText: " Press here ", buttonSystemImageName: "arrowshape.turn.up.right.circle.fill", accentColor: themeColor, backgroundColor: Color.white, buttonAction: nextButtonAction).padding(30).hidden(nextButtonIsHidden)
                    LaunchViewImages(display: animalArray[randomIndex])
                }
                
            }
        }
    }
    
    func nextButtonAction() {
        print("nx")
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
