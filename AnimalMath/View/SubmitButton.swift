//
//  SubmitButton.swift
//  AnimalMath
//
//  Created by Markus Seidler on 30/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

struct SubmitButton: View {
    let buttonAction: () -> Void
    let accentColorButton: Color
    let cornerRadius: CGFloat
    
    var body: some View {
        Button(action:
            self.buttonAction) {
                VStack {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Submit")
                }
                .accentColor(accentColorButton)
                .padding(.horizontal, 11)
                .padding(.vertical, 6)
                .background(Color.white)
            .cornerRadius(cornerRadius)
        }
    }
}

struct SubmitButton_Previews: PreviewProvider {
    
    
    static var previews: some View {
        
        func testAction() -> Void {
            print("button pressed")
        }
        
        return SubmitButton(buttonAction: testAction, accentColorButton: Color.red, cornerRadius: 20)
    }
}
