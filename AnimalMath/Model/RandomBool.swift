//
//  RandomBool.swift
//  AnimalMath
//
//  Created by Markus Seidler on 2/10/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import Foundation

struct RandomBool {
    
    var boolResult: Bool = false
    let dilutionFactor: Int = 25
    
    init() {
        boolResult = randomBool(dilutionFactor: self.dilutionFactor)
    }
    
    
    func randomBool(dilutionFactor: Int) -> Bool {
        let iteration: Int = (100/dilutionFactor/2)
        var randomHistory = [Bool]()
        for _ in 0..<iteration {
            randomHistory.append(Bool.random())
        }
        
        if randomHistory.filter({$0 == true}).count == iteration {
            return true
        } else {
            return false
        }
    }
}
