//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Admin on 9/26/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import XCTest

class CalculatorTests: XCTestCase {
    var calculator: CoreCalculator!
    override func setUp() {
        super.setUp()
        calculator = CoreCalculator()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func input(text: String) {
        for number in text.characters {
            calculator.input(text: String(number))
        }
    }
    
    func testAddNumber() {
        input(text: "0123456789.")
        XCTAssertTrue(calculator.displayValue == "123456789.", "add number error!")
    }
    
    func testAddOperator1() {
        input(text: "50+")
        XCTAssertTrue(calculator!.displayValue == "50", "Error: Display value display wrong when tap Operator")
        XCTAssertTrue(calculator.operatan == 50.0, "Error: Creating operatan doesn't success")
    }
    
    func testAddOperator2() {
        input(text: "10+22")
        XCTAssertTrue(calculator!.displayValue == "22", "Error: Display value display wrong when tap Operator")
        XCTAssertTrue(calculator.operatan == 10, "Error: Creating operatan doesn't success")
    }
    
    func testAddOperator3() {
        input(text: "10+22+")
        XCTAssertTrue(calculator!.displayValue == "32", "Error: Display value display wrong when tap Operator")
        XCTAssertTrue(calculator.operatan == 32, "Error: Creating operatan doesn't success")
    }
    
    func testAddOperator4() {
        input(text: "10+22+50")
        XCTAssertTrue(calculator!.displayValue == "82", "Error: Display value display wrong when tap Operator")
        XCTAssertTrue(calculator.operatan == 32, "Error: Creating operatan doesn't success")
    }
    
    func testSubOperator() {
        input(text: "50-")
        XCTAssertTrue(calculator!.displayValue == "50", "Error: Display value display wrong when tap Operator")
        XCTAssertTrue(calculator.operatan == 50.0, "Error: Creating operatan doesn't success")
    }
    
    func testSubOperator1() {
        input(text: "50-20")
        XCTAssertTrue(calculator!.displayValue == "20", "Error: Display value display wrong when tap Operator")
        XCTAssertTrue(calculator.operatan == 50.0, "Error: Creating operatan doesn't success")
    }
    
    func testSubOperator2() {
        input(text: "50-20-")
        XCTAssertTrue(calculator!.displayValue == "30", "Error: Display value display wrong when tap Operator")
        XCTAssertTrue(calculator.operatan == 30, "Error: Creating operatan doesn't success")
    }
    func testSubOperator3() {
        input(text: "50-20-10")
        XCTAssertTrue(calculator!.displayValue == "10", "Error: Display value display wrong when tap Operator")
        XCTAssertTrue(calculator.operatan == 30, "Error: Creating operatan doesn't success")
    }
    func testSubOperator4() {
        input(text: "50-20-10=")
        XCTAssertTrue(calculator!.displayValue == "20", "Error: Display value display wrong when tap Operator")
        XCTAssertTrue(calculator.operatan == 20, "Error: Creating operatan doesn't success")
    }
    
    func testCombineAddAndSubOperator() {
        input(text: "50-20+10")
        XCTAssertTrue(calculator!.displayValue == "10", "Error: Display value display wrong when tap Operator")
        XCTAssertTrue(calculator.operatan == 30, "Error: Creating operatan doesn't success")
    }
    
    func testCombineAddAndSubOperator1() {
        input(text: "50-20+10=")
        XCTAssertTrue(calculator!.displayValue == "40", "Error: Display value display wrong when tap Operator")
        XCTAssertTrue(calculator.operatan == 40, "Error: Creating operatan doesn't success")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
