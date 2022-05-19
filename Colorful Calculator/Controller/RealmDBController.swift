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
        
    //MARK: - first database inicialisation
    func checkAndCreateDBIfEmpty(){
        if realm.isEmpty {
            let btn = RealmButtonData()
            realm.beginWrite()
            realm.add(btn)
            try! realm.commitWrite()
        }
    }

    //MARK: - getting data from Realm Database
    func loadButtonRadiusFromRealmDB() -> Double{
        checkAndCreateDBIfEmpty()

        let btn = realm.objects(RealmButtonData.self)
        let buttonRadius = btn[btn.count - 1].radius
            
        return buttonRadius
    }
    
    func getNumberBtnUIColour() -> UIColor{
        checkAndCreateDBIfEmpty()
        
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
        checkAndCreateDBIfEmpty()
        
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
        checkAndCreateDBIfEmpty()
        
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
    
    //MARK: - saving data into Realm Database
    func saveConfigurationIntoRealm(numberBtnUIColor: UIColor, rightColumnBtnUIColor: UIColor, topRowBtnUIColor: UIColor, degree: Double){
        let btn = RealmButtonData()
        btn.radius = degree
        
        var numberBtnRedValue: CGFloat{ return CIColor(color: numberBtnUIColor).red }
        var numberBtnGreenValue: CGFloat{ return CIColor(color: numberBtnUIColor).green }
        var numberBtnBlueValue: CGFloat{ return CIColor(color: numberBtnUIColor).blue }
        var numberBtnAlphaValue: CGFloat{ return CIColor(color: numberBtnUIColor).alpha }

        btn.numberBtnColourRed = Double(numberBtnRedValue)
        btn.numberBtnColourGreen = Double(numberBtnGreenValue)
        btn.numberBtnColourBlue = Double(numberBtnBlueValue)
        btn.numberBtnColourAlpha = Double(numberBtnAlphaValue)

        var rightColumnBtnRedValue: CGFloat{ return CIColor(color: rightColumnBtnUIColor).red }
        var rightColumnBtnGreenValue: CGFloat{ return CIColor(color: rightColumnBtnUIColor).green }
        var rightColumnBtnBlueValue: CGFloat{ return CIColor(color: rightColumnBtnUIColor).blue }
        var rightColumnBtnAlphaValue: CGFloat{ return CIColor(color: rightColumnBtnUIColor).alpha }
        
        btn.rightColumnBtnColourRed = Double(rightColumnBtnRedValue)
        btn.rightColumnBtnColourGreen = Double(rightColumnBtnGreenValue)
        btn.rightColumnBtnColourBlue = Double(rightColumnBtnBlueValue)
        btn.rightColumnBtnColourAlpha = Double(rightColumnBtnAlphaValue)
        
        var topRowBtnRedValue: CGFloat{ return CIColor(color: topRowBtnUIColor).red }
        var topRowBtnGreenValue: CGFloat{ return CIColor(color: topRowBtnUIColor).green }
        var topRowBtnBlueValue: CGFloat{ return CIColor(color: topRowBtnUIColor).blue }
        var topRowBtnAlphaValue: CGFloat{ return CIColor(color: topRowBtnUIColor).alpha }
        
        btn.topRowBtnColourRed = Double(topRowBtnRedValue)
        btn.topRowBtnColourGreen = Double(topRowBtnGreenValue)
        btn.topRowBtnColourBlue = Double(topRowBtnBlueValue)
        btn.topRowBtnColourAlpha = Double(topRowBtnAlphaValue)
        
        realm.beginWrite()
        realm.add(btn)
        try! realm.commitWrite()
    }
}
