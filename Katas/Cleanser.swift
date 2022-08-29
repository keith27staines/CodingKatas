//
//  Cleanser.swift
//  Katas
//
//  Created by Keith Staines on 29/08/2022.
//

import Foundation


protocol Cleanser {
    func cleanse(lines: [String]) -> [String]
}

extension Cleanser {
    func removeFirst(from lines: [String]) -> [String] {
        let requiredLines = lines.dropFirst()
        return [String](requiredLines)
    }
    
    func removeLast(from lines: [String]) -> [String] {
        let requiredLines = lines.dropLast()
        return [String](requiredLines)
    }

}

class WeatherDataCleanser: Cleanser {
    func cleanse(lines: [String]) -> [String] {
        var cleansed = removeFirst(from: lines)
        cleansed = removeFirst(from: cleansed)
        cleansed.removeLast()
        cleansed.removeLast()
        return [String](cleansed)
    }
}

class FootballDataCleanser: Cleanser {
    func cleanse(lines: [String]) -> [String] {
        var cleansed = removeFirst(from: lines)
        cleansed = cleansed.filter({ string in
            !string.hasPrefix("---")
        })
        return removeLast(from: cleansed)
    }
}
