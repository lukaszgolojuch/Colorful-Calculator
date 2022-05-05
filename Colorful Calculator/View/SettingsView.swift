//
//  SettingsView.swift
//  Colorful Calculator
//
//  Created by Łukasz Gołojuch on 5/3/22.
//

import SwiftUI
import RealmSwift

struct SettingsView: View {
    
    @State private var numberBtnColour =
            Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    @State private var rightColumnBtnColour =
            Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    @State private var topRowBtnColour =
            Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    @State private var degree: Double = 0
    
    let realm = try! Realm()
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List{
                      Section(header: Text("Buttons Colour")) {
                        ColorPicker("Number buttons colour", selection: $numberBtnColour)
                        ColorPicker("Right column button", selection: $rightColumnBtnColour)
                        ColorPicker("Top row button", selection: $topRowBtnColour)
                      }
                      .listSectionSeparator(.hidden)
                      
                      Section(header: Text("Buttons shape")) {
                          Text("Circle degree \(Int(degree))")
                          Slider(value: $degree, in: 0...45, step: 1)
                          HStack{
                              Spacer()
                              Button(action: {
                              }) {
                                  Text("9")
                                      .font(.system(size: 32))
                                      .frame(
                                        width: getWidth(selectedButton: .nine),
                                        height: getHeight(selectedButton: .nine))
                                      .background(.blue)
                                      .foregroundColor(.white)
                                      .cornerRadius(degree)
                              }
                              Spacer()
                          }
                      }
                      .listSectionSeparatorTint(.red)
                    }
                    .listStyle(.insetGrouped)
                    
                    Spacer()
                    
                    Button("Save configuration") {
                        saveConfigurationIntoRealm()
                    }
                }
            }
            .navigationTitle("Calculator settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func getWidth(selectedButton: Buttons) -> CGFloat {
        if selectedButton == Buttons.zero {
            return ((UIScreen.main.bounds.width - (5*12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    func getHeight(selectedButton: Buttons) -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    func saveConfigurationIntoRealm(){
        let btn = RealmButtonData()
        btn.radius = degree
        
        let numberBtnUIColor = UIColor(numberBtnColour)
        var numberBtnRedValue: CGFloat{ return CIColor(color: numberBtnUIColor).red }
        var numberBtnGreenValue: CGFloat{ return CIColor(color: numberBtnUIColor).green }
        var numberBtnBlueValue: CGFloat{ return CIColor(color: numberBtnUIColor).blue }
        var numberBtnAlphaValue: CGFloat{ return CIColor(color: numberBtnUIColor).alpha }

        btn.numberBtnColourRed = Double(numberBtnRedValue)
        btn.numberBtnColourGreen = Double(numberBtnGreenValue)
        btn.numberBtnColourBlue = Double(numberBtnBlueValue)
        btn.numberBtnColourAlpha = Double(numberBtnAlphaValue)

        let rightColumnBtnUIColor = UIColor(rightColumnBtnColour)
        var rightColumnBtnRedValue: CGFloat{ return CIColor(color: rightColumnBtnUIColor).red }
        var rightColumnBtnGreenValue: CGFloat{ return CIColor(color: rightColumnBtnUIColor).green }
        var rightColumnBtnBlueValue: CGFloat{ return CIColor(color: rightColumnBtnUIColor).blue }
        var rightColumnBtnAlphaValue: CGFloat{ return CIColor(color: rightColumnBtnUIColor).alpha }
        
        btn.rightColumnBtnColourRed = Double(rightColumnBtnRedValue)
        btn.rightColumnBtnColourGreen = Double(rightColumnBtnGreenValue)
        btn.rightColumnBtnColourBlue = Double(rightColumnBtnBlueValue)
        btn.rightColumnBtnColourAlpha = Double(rightColumnBtnAlphaValue)
        
        let topRowBtnUIColor = UIColor(topRowBtnColour)
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

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
