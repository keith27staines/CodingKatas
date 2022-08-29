//
//  DataMunger.swift
//  KatasTests
//
//  Created by Keith Staines on 29/08/2022.
//

import XCTest
@testable import Katas

final class DataReaderTests: XCTestCase {
    func test_read_football_data() {
        let lines = readFootballData()
        let prefix = lines[0].prefix(4)
        XCTAssertEqual(prefix, "Team")
    }
    
    func test_read_weather_data() {
        let lines = readWeatherData()
        let prefix = lines[0].prefix(2)
        XCTAssertEqual(prefix, "Dy")
    }
}

final class WeatherLineAdapterTests: XCTestCase {
    
    func test_adaptLineToWeatherModel() throws {
        let line = "1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5"
        let model = try XCTUnwrap(WeatherModel(line: line))
        XCTAssertEqual(model.day, 1)
        XCTAssertEqual(model.min, 59)
        XCTAssertEqual(model.max, 88)
    }
    
    func testadaptLineToFootballModel() throws {
        let line = "1. Arsenal         38    26   9   3    79  -  36    87"
        let model = try XCTUnwrap(FootballModel(line: line))
        XCTAssertEqual(model.team, "Arsenal")
        XCTAssertEqual(model.goalsScored, 79)
        XCTAssertEqual(model.goalsConceded, 36)
    }
}

final class WeatherDataCleanserTests: XCTestCase {
    
    func test_footballDataCleanser() {
        let sut = FootballDataCleanser()
        let cleansed = sut.cleanse(lines: readFootballData())
        XCTAssertEqual(cleansed.first,
                       "1. Arsenal         38    26   9   3    79  -  36    87"
        )
        XCTAssertEqual(cleansed.last,
                       "20. Leicester       38     5  13  20    30  -  64    28"
        )
        XCTAssertNil(cleansed.first(where: { string in
            string.hasSuffix("-")
        }))
        XCTAssertEqual(cleansed.count, 20)
    }
    
    func test_weatherDataCleanserTests() {
        let sut = WeatherDataCleanser()
        let cleansed = sut.cleanse(lines: readWeatherData())
        XCTAssertEqual(cleansed.first,
            "1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5"
        )
    }
    
    func test_findLargestGoalDifference() {
        let performer = DataMungingPerformer(
            reader: DataFileReader(filename: "football"),
            cleanser: FootballDataCleanser(),
            differenceFinder: MaximumDifferenceFinder<FootballModel>(),
            modelAdapter: FootballModel.init
        )
        XCTAssertEqual(performer.describeMaximumDifference(), "Arsenal have a goal difference of 43")
    }
    
    func test_findLargestTemperatureDifference() {
        let performer = DataMungingPerformer(
            reader: DataFileReader(filename: "weather"),
            cleanser: WeatherDataCleanser(),
            differenceFinder: MaximumDifferenceFinder<WeatherModel>(),
            modelAdapter: WeatherModel.init
        )
        XCTAssertEqual(performer.describeMaximumDifference(), "day 9 has temp difference 54")
    }
}


// Helpers
func readFootballData() -> [String] {
    let reader = DataFileReader(filename: "football")
    return reader.readFile()
}

func readWeatherData() -> [String] {
    let reader = DataFileReader(filename: "weather")
    return reader.readFile()
}
