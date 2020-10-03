//
//  NewGameButton.swift
//  AnimalMath
//
//  Created by Markus Seidler on 3/10/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

struct CustomButton: View {
    
    // MARK: - View Variable
    
    let buttonText: String
    let buttonSystemImageName: String
    let accentColor: Color
    let backgroundColor: Color
    let buttonAction: () -> Void
    
    // MARK: - View Constants
    
    let cornerRadius: CGFloat = 20
    let horizontalPadding: CGFloat = 11
    let verticalPadding: CGFloat = 6
    
    var body: some View {
        Button(action:
            self.buttonAction) {
                VStack {
                    Image(systemName: buttonSystemImageName)
                    Text(buttonText)
                }
                .accentColor(accentColor)
                .padding(.horizontal, horizontalPadding)
                .padding(.vertical, verticalPadding)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
        }
    }
}

struct NewGameButton_Previews: PreviewProvider {
    
    static func testAction() {
        print("test")
    }
    
    static var previews: some View {
        CustomButton(buttonText: "New Game", buttonSystemImageName: "gamecontroller.fill", accentColor: Color.red, backgroundColor: Color.offwhite, buttonAction: testAction)
    }
}
