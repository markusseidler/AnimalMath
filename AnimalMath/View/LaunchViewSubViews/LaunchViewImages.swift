//
//  SwiftUIView.swift
//  AnimalMath
//
//  Created by Markus Seidler on 3/10/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

struct LaunchViewImages: View {
    let display: DisplayItem<String>
    let size: (width: CGFloat, height: CGFloat) = (20, 20)
    let viewPadding: CGFloat = 2
    
    var body: some View {
        Image(display.content)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size.width, height: size.height, alignment: .center)
            .padding(viewPadding)
            .hidden(Bool.random())
//            .hidden(false)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = LaunchViewVM()
        let animalArray = vm.animalModel.animalArray
        
        LaunchViewImages(display: animalArray.first!)
    }
}
