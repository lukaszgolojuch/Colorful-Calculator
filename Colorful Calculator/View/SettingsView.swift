//
//  SettingsView.swift
//  Colorful Calculator
//
//  Created by Łukasz Gołojuch on 5/3/22.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var numberBtnColour =
            Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    @State private var rightColumnBtnColour =
            Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    @State private var topRowBtnColour =
            Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    @State private var degree: Double = 0
    
    var body: some View {
        NavigationView{
            ZStack{
                List {
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
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
