//
//  Calculations.swift
//  Colorful Calculator
//
//  Structure for all calculations and button tap handling
//
//  Created by Łukasz Gołojuch on 4/28/22.
//

import Foundation

struct Calculations {
    
    var storedValue: Double = 0
    var actualValue: Double = 0
    var valueInString: String = "0" //value that we print in label
    var decimalTapped: Bool = false //true for decimal values, false for integer
    var currentOperation: Operations = .none
    
    func getValueForPrint() -> String{
        if decimalTapped {
            return valueInString
        }
        else {
            let value: Int = Int(floor(Double(valueInString) ?? 5))
            return String(value)
        }
    }
    
    mutating func buttonHasBeenTapped(selectedButton: Buttons){
        switch selectedButton {
        case .one,
                .two,
                .three,
                .four,
                .five,
                .six,
                .seven,
                .eight,
                .nine,
                .zero:
            number(for: selectedButton)
        case .add:
            add()
        case .substract:
            substract()
        case .divide:
            divide()
        case .multiply:
            multiply()
        case .equal:
            equal()
        case .clear:
            clear()
        case .decimal:
            decimal()
        case .percent:
            percent()
        case .negative:
            negative()
        }
    }
    
    mutating func corePerformanceForActionButtons(){
        storedValue = Double(valueInString)!
        valueInString = "0"
    }
    
    //MARK: - calculations methods
    mutating func add(){
        corePerformanceForActionButtons()
        currentOperation = .add
    }
    
    mutating func substract(){
        corePerformanceForActionButtons()
        currentOperation = .substract
    }
    
    mutating func multiply(){
        corePerformanceForActionButtons()
        currentOperation = .multiply
    }
    
    mutating func divide(){
        corePerformanceForActionButtons()
        currentOperation = .divide
    }
    
    mutating func equal(){
        actualValue = Double(valueInString)!
        var result: Double
        
        switch currentOperation {
        case .add:
            result = storedValue + actualValue
            valueInString = String(result)
        case .substract:
            result = storedValue - actualValue
            valueInString = String(result)
        case .divide:
            if storedValue.truncatingRemainder(dividingBy: actualValue) != 0{
                //Set decimal if modulo does not equal 0
                decimalTapped = true
            }
            result = storedValue / actualValue
            valueInString = String(result)
        case .multiply:
            result = storedValue * actualValue
            valueInString = String(result)
        case .none:
            break
        }
    }
    
    //MARK: - functional methods
    mutating func clear(){
        decimalTapped = false
        valueInString = "0"
    }
    
    mutating func decimal(){
        if !decimalTapped {
            decimalTapped = true
            valueInString += "."
        }
    }
    
    mutating func percent(){
        decimalTapped = true
        valueInString = String(Double(valueInString)! * 0.01)
    }
    
    mutating func negative(){
        let doubleValue = Double(valueInString)
        
        if doubleValue! > 0 {
            valueInString = "-" + valueInString
        }
        else {
            valueInString = String(-doubleValue!)
        }
    }
    
    //MARK: - number method
    mutating func number(for selectedButton: Buttons){
        if self.valueInString == "0" {
            valueInString = selectedButton.rawValue
        }
        else {
            valueInString += selectedButton.rawValue
        }
    }
}
