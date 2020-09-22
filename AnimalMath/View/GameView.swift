//
//  GameView.swift
//  AnimalMath
//
//  Created by Markus Seidler on 22/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

//https://www.simpleswiftguide.com/how-to-present-new-sheet-view-from-navigationbaritems-button-in-swiftui/
//
//create a navigation to a new gameView with a customized sheet

struct GameView: View {
    var body: some View {
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
