//
//  ButtonsDataRealm.swift
//  Colorful Calculator
//
//  Created by Łukasz Gołojuch on 5/5/22.
//

import UIKit
import RealmSwift

class RealmButtonData: Object{
    @objc dynamic var radius: Double = 45.0
    
    @objc dynamic var numberBtnColourRed: Double = 45.0
    @objc dynamic var numberBtnColourGreen: Double = 45.0
    @objc dynamic var numberBtnColourBlue: Double = 45.0
    @objc dynamic var numberBtnColourAlpha: Double = 1.0
    
    @objc dynamic var rightColumnBtnColourRed: Double = 45.0
    @objc dynamic var rightColumnBtnColourGreen: Double = 45.0
    @objc dynamic var rightColumnBtnColourBlue: Double = 45.0
    @objc dynamic var rightColumnBtnColourAlpha: Double = 1.0
    
    @objc dynamic var topRowBtnColourRed: Double = 45.0
    @objc dynamic var topRowBtnColourGreen: Double = 45.0
    @objc dynamic var topRowBtnColourBlue: Double = 45.0
    @objc dynamic var topRowBtnColourAlpha: Double = 1.0
}
