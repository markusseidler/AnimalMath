//
//  FavoriteColor.swift
//  AnimalMath
//
//  Created by Markus Seidler on 19/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

struct FavoriteColor: Hashable, Identifiable {
    var color: Color
    var isSelected: Bool = false
    var id = UUID()
    
}

struct FavoriteColor_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

