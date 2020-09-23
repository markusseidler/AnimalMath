//
//  DisplayItem.swift
//  AnimalMath
//
//  Created by Markus Seidler on 19/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import Foundation

struct DisplayItem<DisplayContent>: Identifiable, Equatable, Hashable where DisplayContent: Hashable {
    static func == (lhs: DisplayItem<DisplayContent>, rhs: DisplayItem<DisplayContent>) -> Bool {
        lhs.id == rhs.id
    }
    
    var id = UUID()
    var content: DisplayContent
    var isSelected = false
    
}
