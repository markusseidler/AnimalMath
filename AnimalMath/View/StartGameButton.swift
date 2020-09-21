//
//  startButton.swift
//  AnimalMath
//
//  Created by Markus Seidler on 21/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

struct StartGameButton: View {
    let buttonAction: () -> Void
    let accentColorButton: Color
    let cornerRadius: CGFloat
    
    var body: some View {
        Button(action:
            self.buttonAction) {
                HStack {
                    Image(systemName: "gamecontroller.fill")
                    Text("Let's play")
                }
                .accentColor(accentColorButton)
                .padding(10)
                .background(Color.white)
            .cornerRadius(cornerRadius)
            
        }
    }
}

struct startGameButton_Previews: PreviewProvider {
    static var previews: some View {
        let buttonAction = {
            print("test")
        }
        
        
        return StartGameButton(buttonAction: buttonAction, accentColorButton: Color.red, cornerRadius: 20)
    }
}

