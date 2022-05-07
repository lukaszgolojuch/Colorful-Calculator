//
//  ButtonColors.swift
//  Colorful Calculator
//
//  Created by Łukasz Gołojuch on 5/7/22.
//

import Foundation
import SwiftUI
import RealmSwift

let realm = try! Realm()
let realmDBController = RealmDBController()

class ButtonColors: ObservableObject{
    
    var rightColumnColor: UIColor = realmDBController.getRightColumnBtnUIColour()
    var topRowColor: UIColor = realmDBController.getTopRowBtnUIColour()
    var numberBtnColor: UIColor = realmDBController.getNumberBtnUIColour()
}
