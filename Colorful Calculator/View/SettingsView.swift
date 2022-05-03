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
            //Color.black.ignoresSafeArea(.all)
            ZStack{
                List {
                  Section(header: Text("Buttons Colours")) {
                    ColorPicker("Number buttons colour", selection: $numberBtnColour)
                    ColorPicker("Right column button", selection: $rightColumnBtnColour)
                    ColorPicker("Top row button", selection: $topRowBtnColour)
                  }
                  .listSectionSeparator(.hidden)
                  
                  Section(header: Text("Buttons shape")) {
                      Text("Circle degree \(Int(degree))")
                      Slider(value: $degree, in: 0...90, step: 1)
                  }
                  .listSectionSeparatorTint(.red)
                }
                .listStyle(.insetGrouped)
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
