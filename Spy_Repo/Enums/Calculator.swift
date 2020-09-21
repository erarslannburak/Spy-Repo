//
//  Calculator.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 15.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import Foundation
import UIKit

enum CalculatorButton:String {
    case AC
    case plusMinus
    case percent
    case divide
    case multiply
    case minus
    case plus
    case equal
    case decimal = ","
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    
    var backgroundColor: UIColor {
        switch self {
        case .AC,.plusMinus,.percent:
            return .calculatorLightGreyColor
        case .decimal,.zero,.one,.two,.three,.four,.five,.six,.seven,.eight,.nine:
            return .calculatorDarkGreyColor
        default:
            return .calculatorOrangeColor
        }
    }
}
