//
//  Buttons.swift
//  Colorful Calculator
//
//  Created by Łukasz Gołojuch on 4/28/22.
//

import Foundation
import SwiftUI

enum Buttons: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
    
    var colorOfButton: Color{
        switch self{
        case .add, .substract, .divide, .multiply, .equal:
            return .orange
        case .clear, .negative, .percent:
            return Color(.lightGray)
        default:
            return .cyan
        }
    }
}
