//
//  SettingsView.swift
//  Colorful Calculator
//
//  Created by Łukasz Gołojuch on 5/3/22.
//

import SwiftUI
import RealmSwift

struct SettingsView: View {
    let realm = try! Realm()
    let realmDBController = RealmDBController()
    let buttonSeizure = ButtonSeizure()
    
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
                                        width: buttonSeizure.getWidth(selectedButton: .nine),
                                        height: buttonSeizure.getHeight(selectedButton: .nine))
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
                        realmDBController.saveConfigurationIntoRealm(numberBtnUIColor: UIColor(numberBtnColour), rightColumnBtnUIColor: UIColor(rightColumnBtnColour), topRowBtnUIColor: UIColor(topRowBtnColour), degree: degree)
                    }
                }
            }
            .navigationTitle("Calculator settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
