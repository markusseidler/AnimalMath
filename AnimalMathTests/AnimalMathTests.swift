//
//  AnimalMathTests.swift
//  AnimalMathTests
//
//  Created by Markus Seidler on 15/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import XCTest
@testable import AnimalMath

class AnimalMathTests: XCTestCase {
    
    var sutMultiplication: CalculationTable?
    var sutAddition: CalculationTable?
    let numberOfQuestions: NumberOfQuestionsSet = .five
    let highestNumber = 10
    var multiplicationResultArray = [Double]()
    var additionResultArray = [Double]()
//    let leftSide = [Int](1...10).shuffled()
//    let rightSide = [Int](1...10).shuffled()
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sutMultiplication = CalculationTable(numberOfQuestionsEnum: numberOfQuestions, highestNumber: highestNumber) {$0 * $1}
        sutAddition = CalculationTable(numberOfQuestionsEnum: numberOfQuestions, highestNumber: highestNumber) {$0 + $1}
    
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sutMultiplication = nil
        sutAddition = nil
        super.tearDown()
        
    }

//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    func testCountofOutputArrays() {
        XCTAssertEqual(sutMultiplication?.leftSideNumbers.count, numberOfQuestions.asInteger)
        XCTAssertEqual(sutMultiplication?.rightSideNumbers.count, numberOfQuestions.asInteger)
        XCTAssertEqual(sutMultiplication?.calculationResults.count, numberOfQuestions.asInteger)
    }
    
    func testHighestNumberInOutputArrays() {
        XCTAssertTrue((sutMultiplication?.leftSideNumbers.max())! <= Double(highestNumber))
        XCTAssertTrue((sutMultiplication?.rightSideNumbers.max())! <= Double(highestNumber))
    }
    
    func testCalculations() {
        multiplicationResultArray = zip(sutMultiplication!.leftSideNumbers, sutMultiplication!.rightSideNumbers).map() {$0 * $1}
        XCTAssertEqual(sutMultiplication?.calculationResults, multiplicationResultArray)
        
        additionResultArray = zip(sutAddition!.leftSideNumbers, sutAddition!.rightSideNumbers).map() {$0 + $1}
        XCTAssertEqual(sutAddition?.calculationResults, additionResultArray)
    }
    

    


}
