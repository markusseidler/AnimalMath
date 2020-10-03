//
//  StartViewBackGround.swift
//  AnimalMath
//
//  Created by Markus Seidler on 22/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

struct StartLabelView: View {
    let themeColor: Color
    let cornerRadius: CGFloat
    
    // MARK: - View Constant
    
    let frameWidth: CGFloat = 250.0
    let frameHeight: CGFloat = 50.0
    let labelName = "Animal Math"
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: cornerRadius).fill(themeColor)
            Text(labelName)
                .font(.largeTitle)
            
        }.frame(width: frameWidth, height: frameHeight, alignment: .center)
    }
    
}

struct StartViewBackGround_Previews: PreviewProvider {
    static var previews: some View {
        StartLabelView(themeColor: Color.red, cornerRadius: 20)
    }
}
