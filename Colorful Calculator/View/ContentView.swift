//
//  ContentView.swift
//  Colorful Calculator
//
//  Created by Łukasz Gołojuch on 4/17/22.
//

import SwiftUI

struct ContentView: View {
    
    let buttons: [[Buttons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .substract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]

    @State var calculations = Calculations()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Text(calculations.valueInString)
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
                                            width: getWidth(selectedButton: object),
                                            height: getHeight(selectedButton: object))
                                        .background(object.colorOfButton)
                                        .foregroundColor(.white)
                                        .cornerRadius(90)
                                }
                            }
                        }
                    }
                }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
