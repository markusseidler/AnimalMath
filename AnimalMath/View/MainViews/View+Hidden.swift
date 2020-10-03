//
//  View+Hidden.swift
//  AnimalMath
//
//  Created by Markus Seidler on 3/10/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}
