//
//  ContentView.swift
//  Colorful Calculator
//
//  Created by Łukasz Gołojuch on 4/17/22.
//

import SwiftUI

enum Buttons: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
    
    var colorOfButton: Color{
        switch self{
        case .add, .substract, .divide, .multiply, .equal:
            return .orange
        case .clear, .negative, .percent:
            return Color(.lightGray)
        default:
            return .cyan
        }
    }
}

struct ContentView: View {
    
    let buttons: [[Buttons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .substract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    @State var actualValue: Double = 0
    @State var valueInString: String = "0"
    @State var typingIsFinished: Bool = true
    @State var decimalTapped: Bool = false

    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Text(String(actualValue))
                        .bold()
                        .font(.system(size: 75))
                        .foregroundColor(.white)
                }
                .padding()
                
                ForEach(buttons, id: \.self) { row in
                    HStack{
                        ForEach(row, id: \.self) {object in
                            Button(action: {
                                buttonHasBeenTapped(selectedButton: object)
                            }) {
                                Text(object.rawValue)
                                    .font(.system(size: 32))
                                    .frame(
                                        width: getWidth(selectedButton: object),
                                        height: getHeight(selectedButton: object))
                                    .background(object.colorOfButton)
                                    .foregroundColor(.white)
                                    .cornerRadius(35)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func getWidth(selectedButton: Buttons) -> CGFloat {
        if selectedButton == Buttons.zero {
            return (UIScreen.main.bounds.width - (5*12)) / 2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    func getHeight(selectedButton: Buttons) -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    func buttonHasBeenTapped(selectedButton: Buttons){
        switch selectedButton {
        case .one,
                .two,
                .three,
                .four,
                .five,
                .six,
                .seven,
                .eight,
                .nine,
                .zero:
            
            if typingIsFinished {
//                valueInString = String((floor(Double(selectedButton.rawValue)!)))
//                actualValue = Double(valueInString)!
                actualValue = floor(Double(selectedButton.rawValue)!)
            }
            else{
                valueInString += String((floor(Double(selectedButton.rawValue)!)))
                actualValue = Double(valueInString)!
            }
        case .add:
            print("Add button tapped")
        case .substract:
            print("Substract button tapped")
        case .divide:
            print("Divide button tapped")
        case .multiply:
            print("Multiply button tapped")
        case .equal:
            print("=")
        case .clear:
            actualValue = 0.0
        case .decimal:
            if !typingIsFinished {
                valueInString += ".0"
                actualValue = Double(valueInString)!
            }
        case .percent:
            actualValue = actualValue * 0.01
        case .negative:
            actualValue = -actualValue
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
