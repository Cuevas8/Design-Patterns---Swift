//
//  MathCalculator.swift
//  AccessControl
//
//  Created by Bryan Cuevas on 5/25/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import Foundation

class MathDoer {
    
    public func perform(x: Int, y: Int) -> Int {
        return add(x: x, y: y)
    }
    
    private func add(x: Int, y: Int) -> Int {
        return x + y
    }
}
