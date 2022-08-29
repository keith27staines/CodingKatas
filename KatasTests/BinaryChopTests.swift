//
//  KatasTests.swift
//  KatasTests
//
//  Created by Keith Staines on 28/08/2022.
//

import XCTest
@testable import Katas

final class BinaryChopTests: XCTestCase {

    func test_zeroElements() {
        let sut = BinaryChop()
        XCTAssertEqual(nil, sut.indexOf(6, in: [Int]()))
    }
    
    func test_for_value_not_present_in_array_of_1() {
        let sut = BinaryChop()
        XCTAssertEqual(nil, sut.indexOf(1, in: [0]))
    }
    
    func test_for_value_is_present_in_array_of_1() {
        let sut = BinaryChop()
        XCTAssertEqual(0, sut.indexOf(1, in: [1]))
    }
    
    func test_for_value_is_present_in_array_of_2() {
        let sut = BinaryChop()
        XCTAssertEqual(0, sut.indexOf(1, in: [1]))
    }
    
    func test_for_value_is_first_element_in_array_of_2() {
        let sut = BinaryChop()
        XCTAssertEqual(0, sut.indexOf(1, in: [1,2]))
    }
    
    func test_for_value_is_second_element_in_array_of_2() {
        let sut = BinaryChop()
        XCTAssertEqual(1, sut.indexOf(2, in: [1,2]))
    }
    
    func test_for_value_at_index0_in_array_of_3() {
        let sut = BinaryChop()
        XCTAssertEqual(0, sut.indexOf(1, in: [1,2,3]))
    }
    
    func test_for_value_at_index1_in_array_of_3() {
        let sut = BinaryChop()
        XCTAssertEqual(1, sut.indexOf(2, in: [1,2,3]))
    }
    
    func test_for_value_at_index2_in_array_of_3() {
        let sut = BinaryChop()
        XCTAssertEqual(2, sut.indexOf(3, in: [1,2,3]))
    }
    
    func test_for_value_at_index0_in_array_of_4() {
        let sut = BinaryChop()
        XCTAssertEqual(0, sut.indexOf(1, in: [1,2,3,4]))
    }
    
    func test_for_value_at_index1_in_array_of_4() {
        let sut = BinaryChop()
        XCTAssertEqual(1, sut.indexOf(2, in: [1,2,3,4]))
    }
    
    func test_for_value_at_index2_in_array_of_4() {
        let sut = BinaryChop()
        XCTAssertEqual(2, sut.indexOf(3, in: [1,2,3,4]))
    }
    
    func test_for_value_at_index3_in_array_of_4() {
        let sut = BinaryChop()
        XCTAssertEqual(3, sut.indexOf(4, in: [1,2,3,4]))
    }
    
    func test_for_value_at_index2_in_array_of_45() {
        let sut = BinaryChop()
        XCTAssertEqual(2, sut.indexOf(3, in: [1,2,3,4,5]))
    }
    

}

class BinaryChop {
    func indexOf(_ search: Int, in array: [Int]) -> Int? {
        let firstIndex = 0
        let lastIndex = array.count - 1

        return
            binaryChop(
                search,
                in: array,
                firstIndex: firstIndex,
                lastIndex: lastIndex)
    }
    
    func binaryChop(_ search: Int, in array: [Int], firstIndex: Int, lastIndex: Int) -> Int? {
        guard array.count > 0 else { return nil }
        guard lastIndex - firstIndex > 0 else {
            return array[firstIndex] == search ? firstIndex : nil
        }
        guard lastIndex - firstIndex > 1 else {
            if array[firstIndex] == search { return firstIndex }
            if array[lastIndex] == search { return lastIndex }
            return nil
        }
        let midIndex = (firstIndex + lastIndex)/2
        return
            binaryChop(
                search,
                in: array,
                firstIndex: firstIndex,
                lastIndex: midIndex) ??
            binaryChop(
                search,
                in: array,
                firstIndex: midIndex + 1,
                lastIndex: lastIndex)
        
                
    }
}
