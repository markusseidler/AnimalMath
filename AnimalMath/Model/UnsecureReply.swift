//
//  UnsecureReply.swift
//  AnimalMath
//
//  Created by Markus Seidler on 2/10/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

struct UnsecureReply {
    var reply: String = ""
    
    init() {
        reply = createReply()
    }
    
    private let unsecureReplies: [String] = [
        "Are you really sure about it?",
        "Do you want to think about it again?",
        "Really? Do you think this is right?",
        "Hmmm...sure?",
        "Do you want to ask a friend?"]
    
    private func createReply() -> String {
        let randomIndex = Int.random(in: 0..<unsecureReplies.count)
        return unsecureReplies[randomIndex]
    }
}

