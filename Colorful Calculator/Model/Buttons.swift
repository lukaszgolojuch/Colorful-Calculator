//
//  Buttons.swift
//  Colorful Calculator
//
//  Created by Łukasz Gołojuch on 4/28/22.
//

import Foundation
import SwiftUI
import RealmSwift

let realm = try! Realm()
let realmDBController = RealmDBController()

enum Buttons: String{
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
    
    var colorOfButton: UIColor{
        switch self{
        case .add, .substract, .divide, .multiply, .equal:
            return realmDBController.getRightColumnBtnUIColour()
        case .clear, .negative, .percent:
            return realmDBController.getTopRowBtnUIColour()
        default:
            return realmDBController.getNumberBtnUIColour()
        }
    }
}
