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

