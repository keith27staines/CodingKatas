//
//  MaximumDifferenceFinder.swift
//  Katas
//
//  Created by Keith Staines on 29/08/2022.
//

import Foundation

protocol Differencing {
    func difference() -> Int
}

protocol SelfDescribing {
    func describe() -> String
}

class MaximumDifferenceFinder<T: Differencing> {
    
    init() {}
    
    func findMaximumDifference<T: Differencing>(_ models: [T]) -> T? {
        var maxDifference = 0
        var maxModel: T?
        models.forEach { model in
            let difference = model.difference()
            if difference > maxDifference {
                maxModel = model
                maxDifference = difference
            }
        }
        return maxModel
    }
}
