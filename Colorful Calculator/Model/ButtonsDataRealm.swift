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
    
    //MARK: - proprties for number buttons
    @objc dynamic var numberBtnColourRed: Double = 115.0
    @objc dynamic var numberBtnColourGreen: Double = 147.0
    @objc dynamic var numberBtnColourBlue: Double = 179.0
    @objc dynamic var numberBtnColourAlpha: Double = 1.0
    
    //MARK: - properties for right column buttons
    @objc dynamic var rightColumnBtnColourRed: Double = 255.0
    @objc dynamic var rightColumnBtnColourGreen: Double = 165.0
    @objc dynamic var rightColumnBtnColourBlue: Double = 0.0
    @objc dynamic var rightColumnBtnColourAlpha: Double = 1.0
    
    //MARK: - properties for top row buttons
    @objc dynamic var topRowBtnColourRed: Double = 112.0
    @objc dynamic var topRowBtnColourGreen: Double = 128.0
    @objc dynamic var topRowBtnColourBlue: Double = 144.0
    @objc dynamic var topRowBtnColourAlpha: Double = 1.0
}
