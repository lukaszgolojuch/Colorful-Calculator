//
//  ContentView.swift
//  Colorful Calculator
//
//  Created by Łukasz Gołojuch on 4/17/22.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    let buttons: [[Buttons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .substract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]

    @State var calculations = Calculations()
    let realmDBController = RealmDBController()
    let buttonSeizure = ButtonSeizure()

    var body: some View {
        NavigationView{
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Text(calculations.getValueForPrint())
                            .bold()
                            .font(.system(size: 75))
                            .foregroundColor(.white)
                    }
                    .padding()
                    
                    ForEach(buttons, id: \.self) { row in
                        HStack{
                            ForEach(row, id: \.self) {object in
                                Button(action: {
                                    calculations.buttonHasBeenTapped(selectedButton: object)
                                }) {
                                    Text(object.rawValue)
                                        .font(.system(size: 32))
                                        .frame(
                                            width: buttonSeizure.getWidth(selectedButton: object),
                                            height: buttonSeizure.getHeight(selectedButton: object))
                                        .background(Color(object.colorOfButton))
                                        .foregroundColor(.white)
                                        .cornerRadius(realmDBController.loadButtonRadiusFromRealmDB())
                                }
                            }
                        }
                    }
                }
            }
            .onAppear(){
                calculations.valueInString = "Changing color..."
                calculations.buttonHasBeenTapped(selectedButton: .clear)
            }
            .toolbar {
                NavigationLink(destination: SettingsView()) {
                    Image(systemName: "gear")
                        .background(.black)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
