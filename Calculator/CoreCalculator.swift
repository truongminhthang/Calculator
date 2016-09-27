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
    var operatan: Double! {
        didSet {
            displayValue = operatan.display
        }
    }
    var beforeOperatorString = ""
    lazy var tempOperatan : Double = 0
    lazy var tempBeforeOperatorString: String = ""
    var needToResetDisplayValue = false
    
    var isPendingState : Bool = false {
        didSet {
            if isPendingState == false && oldValue == true {
                excute(operatan: tempOperatan, operatorString: tempBeforeOperatorString)
                tempOperatan = 0
                tempBeforeOperatorString = ""
            }
        }
    }
    
    func input(text: String) {
        switch text {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".":
            appendString(numberString: text)
        case "*", "/":
            onTapMultiplyAndDivide(nowOperatorString: text)
        case "+", "-":
            onTapAddAndSubtract(nowOperatorString: text)
        case "=":
            onTapEqual()
        case "%":
            onTapPercent()
            
        default:
            break
        }
    }
    
    func appendString(numberString: String) {
        if displayValue == "0" || needToResetDisplayValue {
            displayValue = ""
            needToResetDisplayValue = false
        }
        displayValue.append(numberString)
    }
    
    func onTapEqual() {
        if operatan != nil {
            excute(operatan: operatan, operatorString: beforeOperatorString)
            isPendingState = false
        }
        beforeOperatorString = ""
    }
    
    func onTapPercent() {
        if "+-".contains(beforeOperatorString) {
            if isPendingState == false {
                tempOperatan = operatan
                tempBeforeOperatorString = beforeOperatorString
                operatan = (Double(displayValue) ?? 0.0) / 100
                isPendingState = true
            }
        } else if beforeOperatorString == "" {
            operatan = (Double(displayValue) ?? 0.0) / 100
        }
    }
    
    func onTapMultiplyAndDivide(nowOperatorString: String) {
        needToResetDisplayValue = true
        if beforeOperatorString != "" {
            if "+-".contains(beforeOperatorString) {
                if isPendingState == false {
                    tempOperatan = operatan
                    tempBeforeOperatorString = beforeOperatorString
                    operatan = (Double(displayValue) ?? 0.0)
                    isPendingState = true
                }
            } else {
                excute(operatan: operatan, operatorString: beforeOperatorString)
            }
        } else {
            operatan = (Double(displayValue) ?? 0.0)
        }
        beforeOperatorString = nowOperatorString
    }
    
    func onTapAddAndSubtract(nowOperatorString: String) {
        needToResetDisplayValue = true
        if beforeOperatorString != "" {
            excute(operatan: operatan, operatorString: beforeOperatorString)
            isPendingState = false
        } else {
            operatan = (Double(displayValue) ?? 0.0)
        }
        beforeOperatorString = nowOperatorString
    }
    
    func excute(operatan: Double, operatorString: String) {
        switch operatorString {
        case "+":
            self.operatan = operatan + (Double(displayValue) ?? 0.0)
        case "-":
            self.operatan = operatan - (Double(displayValue) ?? 0.0)
        case "*":
            self.operatan = operatan * (Double(displayValue) ?? 0.0)
        case "/":
            self.operatan = operatan / (Double(displayValue) ?? 0.0)
        default:
            break
        }
    }
}

extension Double {
    var display: String {
        if self.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", self)
        } else {
            return "\(self)"
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
    var isEqualOperator: Bool {
        if (self.characters.count == 1 && "=".contains(self)) {
            return true
        }
        return false
    }
}
