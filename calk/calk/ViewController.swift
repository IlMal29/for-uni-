//
//  ViewController.swift
//  calk
//
//  Created by Илья Малышев on 14.06.2022.
//

import SwiftUI

enum CalcButton: String{
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
    case subtract = "-"
    case divide = "/"
    case mutliplay = "x"
    case equal = "="
    case clear = "AC"
    case desimal = "."
    case  percent = "%"
    case negative = "-/+"
    
    var buttonColor: Color{
        switch self{
        case .add,.subtract,.mutliplay,.divide,.equal:
            return .green
        case .clear,.negative,.percent:
            return Color(.lightGray)
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
}
enum Operation{
    case add, subtract, divide, mutliplay,desimal, negative, percent, none
}



struct ContentView: View {
    
   
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none

    
    let buttons: [[CalcButton]] = [
        [.clear,.negative,.percent,.divide],
        [.seven,.eight,.nine,.mutliplay],
        [.four,.five,.six,.subtract],
        [.one,.two,.three,.add],
        [.zero,.desimal,.equal]
    ]
    var body: some View {
        ZStack{
            
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()

                //display text
                HStack{
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 95))
                        .foregroundColor(.green)
                    
                }
                .padding()
                
                //buttons
                ForEach(buttons, id: \.self) { row in
                    HStack (spacing: 12){
                        ForEach( row, id: \.self  ) { item in
                            Button(action: {
                                self.didTap(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 36))
                                    .frame(
                                        
                                        width: self.buttonWidth(item: item),
                                        height: self.buttonHeight()
                                    
                                    )
                                    .background(item.buttonColor)
                                    .foregroundColor(Color.black)
                                    .cornerRadius(self.buttonWidth(item: item)/2)
                            })
                        }
                    }
                    .padding(.bottom, 3)
                }
                
            }
        }
    }
    
    func didTap(button: CalcButton){
        switch button {
        case.add,.subtract,.mutliplay,.divide,.equal,.desimal,.negative,.percent:
            if button == .negative{
                self.currentOperation = .negative
                self.runningNumber = Int(self.value) ?? 0
                }
            else if button == .percent{
                self.currentOperation = .percent
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .desimal{
                self.currentOperation = .desimal
                self.runningNumber = Int(self.value) ?? 0
            }
            //Fix bag 
            else if button == .add{
                self.currentOperation = .add
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .subtract{
                self.currentOperation = .subtract
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .mutliplay{
                self.currentOperation = .mutliplay
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .divide{
                self.currentOperation = .divide
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .equal{
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                switch self.currentOperation{
                case .add: self.value = "\(runningValue + currentValue)"
                case .subtract: self.value = "\(runningValue - currentValue)"
                case .mutliplay: self.value = "\(runningValue * currentValue)"
                case .divide: self.value = "\(runningValue / currentValue)"
                case .negative: self.value = "\(runningValue*(-1))"
                case .desimal:self.value = "\(runningValue - 1)"
                                    
                case .percent:self.value = "\(runningValue * 100)"
                                    
                case .none:
                    break
                
                }
            }
            if button != .equal {
                self.value = "0"
            }
        case.clear:
            self.value = "0"
        
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            }
            else{
                self.value = "\(self.value)\(number)"
            }
        }
        
    }
  //
    func buttonWidth(item: CalcButton) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4*12)) / 4)*2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
// appstore ver1
//somfing chenges 
