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
    @StateObject var views = Views()

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
    let hStackSpacing: CGFloat = 3
    let numberOfLVImages: Int = 13
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [themeColor, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                LinearGradient(gradient: Gradient(colors: [themeColor, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    Group {
                        HStack(spacing: hStackSpacing) {
                            ForEach (0..<numberOfLVImages) { _ in
                                LaunchViewImages(display: animalArray[randomIndex])
                            }
                        }
                        HStack(spacing: hStackSpacing) {
                            ForEach (0..<numberOfLVImages) { _ in
                                LaunchViewImages(display: animalArray[randomIndex])
                            }
                        }
                        HStack(spacing: hStackSpacing) {
                            ForEach (0..<numberOfLVImages) { _ in
                                LaunchViewImages(display: animalArray[randomIndex])
                            }
                        }
                        HStack(spacing: hStackSpacing) {
                            ForEach (0..<numberOfLVImages) { _ in
                                LaunchViewImages(display: animalArray[randomIndex])
                            }
                        }
                    }
        
                    
                    HStack {
                        HStack(spacing: hStackSpacing) {
                            ForEach (0..<1) { _ in
                                LaunchViewImages(display: animalArray[randomIndex])
                            }
                        }
                        StartLabelView(themeColor: themeColor, cornerRadius: cornerRadius)
                            .padding()
                        HStack(spacing: hStackSpacing) {
                            ForEach (0..<1) { _ in
                                LaunchViewImages(display: animalArray[randomIndex])
                            }
                        }
                    }
                    
                    Spacer()
                    Group {
                        HStack(spacing: hStackSpacing) {
                            ForEach (0..<numberOfLVImages) { _ in
                                LaunchViewImages(display: animalArray[randomIndex])
                            }
                        }
                        HStack(spacing: hStackSpacing) {
                            ForEach (0..<numberOfLVImages) { _ in
                                LaunchViewImages(display: animalArray[randomIndex])
                            }
                        }
                        HStack(spacing: hStackSpacing) {
                            ForEach (0..<numberOfLVImages) { _ in
                                LaunchViewImages(display: animalArray[randomIndex])
                            }
                        }
                        HStack(spacing: hStackSpacing) {
                            ForEach (0..<numberOfLVImages) { _ in
                                LaunchViewImages(display: animalArray[randomIndex])
                            }
                        }
                    }
                    
                    Group {
                        QuestionLabelView(QuestionHeader: .favoriteColor, QuestionCaption: .chooseAndTap)
                            .padding(.top, 10)
                        
                        ColorChoiceHstack(game: game, nextButtonIsHidden: $nextButtonIsHidden)
                            .padding(.bottom, viewPadding)
                    }
                    HStack(spacing: hStackSpacing) {
                        ForEach (0..<numberOfLVImages) { _ in
                            LaunchViewImages(display: animalArray[randomIndex])
                        }
                    }
                    
                    HStack {
                        
                        HStack(spacing: hStackSpacing) {
                            ForEach (0..<2) { _ in
                                LaunchViewImages(display: animalArray[randomIndex])
                            }
                        }
                        NavigationLink(
                            destination: StartView(game: game),
                            isActive: self.$views.naviLinkIsActive,
                            label: {EmptyView()})
                        
                        LaunchViewImages(display: animalArray[randomIndex])
                        CustomButton(buttonText: "  Tap here  ", buttonSystemImageName: "arrowshape.turn.up.right.circle.fill", accentColor: themeColor, backgroundColor: Color.white, buttonAction: nextButtonAction).padding(30).hidden(nextButtonIsHidden)
                        LaunchViewImages(display: animalArray[randomIndex])
                        
                        HStack(spacing: hStackSpacing) {
                            ForEach (0..<2) { _ in
                                LaunchViewImages(display: animalArray[randomIndex])
                            }
                        }
                    }
                    
                }
            }.navigationBarHidden(true)
        }.environmentObject(views)
    }
    
    func nextButtonAction() {
        views.naviLinkIsActive = true
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        let lvVM = LaunchViewVM()
        
        LaunchView(launchViewVM: lvVM)
    }
}
