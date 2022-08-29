//
//  Models.swift
//  Katas
//
//  Created by Keith Staines on 29/08/2022.
//

import Foundation

struct FootballModel {
    
    let team: String
    let goalsScored: Int
    let goalsConceded: Int
    
    init?(line: String) {
        let components = line.components(separatedBy: .whitespaces).filter { string in
            string != ""
        }
        team = components[1]
        guard
            let goalsScored = integerFromString(string: components[6]),
            let goalsConceded = integerFromString(string: components[8])
        else { return nil }
        
        self.goalsConceded = goalsConceded
        self.goalsScored = goalsScored
    }
}

extension FootballModel: Differencing {
    func difference() -> Int {
        goalsScored - goalsConceded
    }
}

extension FootballModel: SelfDescribing {
    func describe() -> String {
        "\(team) have a goal difference of \(difference())"
    }
}

struct WeatherModel {
    
    let day: Int
    let max: Int
    let min: Int
    
    init?(line: String) {
        let components = line.components(separatedBy: .whitespaces).filter { string in
            string != ""
        }
        guard
            let day = integerFromString(string: components[0]),
            let max = integerFromString(string: components[1]),
            let min = integerFromString(string: components[2])
        else { return nil }
        self.day = day
        self.min = min
        self.max = max
    }
    
    
}

extension WeatherModel: Differencing {
    func difference() -> Int {
        max - min
    }
}

extension WeatherModel: SelfDescribing {
    func describe() -> String {
        "day \(day) has temp difference \(difference())"
    }
}


// Helpers

fileprivate func integerFromString(string: String) -> Int? {
    Int(removeAsterisk(string: string))
}

fileprivate func removeAsterisk(string: String) -> String {
    string.replacingOccurrences(of: "*", with: "")
}
