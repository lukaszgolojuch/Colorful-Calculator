//
//  ButtonSeizure.swift
//  Colorful Calculator
//
//  Created by Łukasz Gołojuch on 5/7/22.
//

import UIKit

struct ButtonSeizure {
    func getWidth(selectedButton: Buttons) -> CGFloat {
        if selectedButton == Buttons.zero {
            return ((UIScreen.main.bounds.width - (5*12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    func getHeight(selectedButton: Buttons) -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
}
