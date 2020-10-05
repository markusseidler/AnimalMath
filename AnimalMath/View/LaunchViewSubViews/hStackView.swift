//
//  hStackView.swift
//  AnimalMath
//
//  Created by Markus Seidler on 5/10/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

struct hStackView: View {
    @StateObject var launchViewVM: LaunchViewVM
    
    var numberOfViews: Int
    
    var animalArray: [DisplayItem<String>] {
        launchViewVM.animalModel.animalArray
    }
    
    var randomIndex: Int {
            launchViewVM.randomInt()
    }
    
    // MARK: - View Constants
    let hStackSpacing: CGFloat = 3
    let numberOfLVImages: Int = 13
    
    
    var body: some View {
        ForEach(0..<numberOfViews) {_ in
            HStack(spacing: hStackSpacing) {
                ForEach (0..<numberOfLVImages) { _ in
                    LaunchViewImages(display: animalArray[randomIndex])
                }
            }
        }
    }
}

struct hStackView_Previews: PreviewProvider {
    static var previews: some View {
        hStackView(launchViewVM: LaunchViewVM(), numberOfViews: 5)
    }
}
