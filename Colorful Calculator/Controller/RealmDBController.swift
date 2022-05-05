//
//  RealmDBController.swift
//  Colorful Calculator
//
//  Created by Łukasz Gołojuch on 5/5/22.
//

import Foundation
import RealmSwift

struct RealmDBController {
    let realm = try! Realm()

    func loadButtonRadiusFromRealmDB() -> Double{
        let btn = realm.objects(RealmButtonData.self)
        let buttonRadius = btn[btn.count - 1].radius
        
        return buttonRadius
    }
    
    func getNumberBtnUIColour() -> UIColor{
        let btn = realm.objects(RealmButtonData.self)
        let colorRed = btn[btn.count - 1].numberBtnColourRed
        let colorGreen = btn[btn.count - 1].numberBtnColourGreen
        let colorBlue = btn[btn.count - 1].numberBtnColourBlue
        let colorAlpha = btn[btn.count - 1].numberBtnColourAlpha
        
        return UIColor(
                red: CGFloat(colorRed),
                green: CGFloat(colorGreen),
                blue: CGFloat(colorBlue),
                alpha: CGFloat(colorAlpha)
            )
    }
    
    func getRightColumnBtnUIColour() -> UIColor{
        let btn = realm.objects(RealmButtonData.self)
        let colorRed = btn[btn.count - 1].rightColumnBtnColourRed
        let colorGreen = btn[btn.count - 1].rightColumnBtnColourGreen
        let colorBlue = btn[btn.count - 1].rightColumnBtnColourBlue
        let colorAlpha = btn[btn.count - 1].rightColumnBtnColourAlpha
        
        return UIColor(
                red: CGFloat(colorRed),
                green: CGFloat(colorGreen),
                blue: CGFloat(colorBlue),
                alpha: CGFloat(colorAlpha)
            )
    }
    
    func getTopRowBtnUIColour() -> UIColor{
        let btn = realm.objects(RealmButtonData.self)
        let colorRed = btn[btn.count - 1].topRowBtnColourRed
        let colorGreen = btn[btn.count - 1].topRowBtnColourGreen
        let colorBlue = btn[btn.count - 1].topRowBtnColourBlue
        let colorAlpha = btn[btn.count - 1].topRowBtnColourAlpha
        
        return UIColor(
                red: CGFloat(colorRed),
                green: CGFloat(colorGreen),
                blue: CGFloat(colorBlue),
                alpha: CGFloat(colorAlpha)
            )
    }
}
