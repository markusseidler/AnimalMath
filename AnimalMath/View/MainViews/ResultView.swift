//
//  ResultView.swift
//  AnimalMath
//
//  Created by Markus Seidler on 2/10/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

struct ResultView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var views: Views
    @StateObject var game: CalculationGame
    
    @State var isRotated: Bool = false
    
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
                        .rotation3DEffect(Angle.degrees(isRotated ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        
                        Image(imageString).resizable().aspectRatio(contentMode: .fit).frame(width: geometry.size.width * 0.6, height: geometry.size.height * 0.40, alignment: .center)
                        
                            CustomButton(buttonText: " New Game ", buttonSystemImageName: "gamecontroller.fill", accentColor: themeColor, backgroundColor: Color.offwhite, buttonAction: dismissResultViewAction)
                                .padding(.bottom, 40)
                        
                    }
                    .foregroundColor(themeColor)
                    
                }
            }.onAppear(perform: startRotation)
    }
    
    func dismissResultViewAction() {
        presentationMode.wrappedValue.dismiss()
        views.naviLinkIsActive = false
    }
    
    func startRotation() {
        withAnimation(.easeInOut(duration: 1.0)) {
            isRotated.toggle()
        }
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
