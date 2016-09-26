//
//  CoreCalculator.swift
//  Calculator
//
//  Created by Admin on 9/26/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class CoreCalculator {
    var displayValue = "0"
    var operatan: Double = 0.0 {
        didSet {
            displayValue = operatan.display
        }
    }
    let numbersString = "0123456789."
    var needToResetDisplayValue = false
    
    func input(text: String) {
        if text.isNumber {
            appendString(numberString: text)
        } else if text.isOperator {
            onTapOperator(operatorString: text)
        }
        
    }
    
    func appendString(numberString: String) {
        if displayValue == "0" || needToResetDisplayValue {
            displayValue = ""
            needToResetDisplayValue = false
        }
        displayValue.append(numberString)
    }
    
    func onTapOperator(operatorString: String) {
        switch operatorString {
        case "+":
            add()
        case "-":
            add()
        case "*":
            add()
        case "/":
            add()

        default:
            break
        }
    }
    
    func add(){
        needToResetDisplayValue = true
        operatan = operatan + (Double(displayValue) ?? 0.0)
        
    }
    
    
}

extension Double {
    var display: String {
        self.truncatingRemainder(dividingBy: 1)
        if  truncatingRemainder > 0 && truncatingRemainder < 1 {
            return "\(self)"
        } else {
            return String(format: "%.0f", self)
        }
    }
}

extension String {
    var isNumber: Bool {
        if (self.characters.count == 1 && "0123456789.".contains(self)) {
            return true
        }
        return false
    }
    
    var isOperator: Bool {
        let operatorString = "+-*/"
        if (self.characters.count == 1 && operatorString.contains(self)) {
            return true
        }
        return false
    }
}
