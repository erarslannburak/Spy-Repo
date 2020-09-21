//
//  CalculatorViewModel.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 15.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import Foundation
import UIKit


//MARK: - CalculatorButtonListViewModel

struct CalculatorButtonListViewModel {
    let calculatorButtonVMList = [CalculatorButtonViewModel(.AC),
                                  CalculatorButtonViewModel(.plusMinus),
                                  CalculatorButtonViewModel(.percent),
                                  CalculatorButtonViewModel(.divide),
                                  CalculatorButtonViewModel(.seven),
                                  CalculatorButtonViewModel(.eight),
                                  CalculatorButtonViewModel(.nine),
                                  CalculatorButtonViewModel(.multiply),
                                  CalculatorButtonViewModel(.four),
                                  CalculatorButtonViewModel(.five),
                                  CalculatorButtonViewModel(.six),
                                  CalculatorButtonViewModel(.minus),
                                  CalculatorButtonViewModel(.one),
                                  CalculatorButtonViewModel(.two),
                                  CalculatorButtonViewModel(.three),
                                  CalculatorButtonViewModel(.plus),
                                  CalculatorButtonViewModel(.zero),
                                  CalculatorButtonViewModel(.decimal),
                                  CalculatorButtonViewModel(.equal),
    ]
    
    var datasource: CollectionDataSource<DefaultCellModel<CalculatorButtonViewModel>>!
    
    var screenTitle:Dynamic<String> = Dynamic("0")
    var resultTitle:String? = nil
    var result:Double? = nil
    var inputTitle:String = "0.0"
    var input:Double = 0
    
    var isDecimal:Bool = false
    var operation:CalculatorButton?
    var isOperation:Bool = true

    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.usesGroupingSeparator = true
        formatter.groupingSeparator = "."
        formatter.maximumFractionDigits = 9
        formatter.decimalSeparator = ","
        return formatter
    }()
    
    init() {
        self.datasource = CollectionDataSource((self.getDefaultCellModel(calculatorButtonVMList)))
    }
}

extension CalculatorButtonListViewModel {
    func cellForItemAt(_ indexPath:IndexPath) -> CalculatorButtonViewModel {
        return calculatorButtonVMList[indexPath.row]
    }
    
    mutating func didSelectForItemAt(_ indexPath:IndexPath) {
        
        let action = calculatorButtonVMList[indexPath.row].calcultorButton
        
        switch action {
        case .decimal:
            decimal(button: action)
        case .zero,.one,.two,.three,.four,.five,.six,.seven,.eight,.nine:
            numberPress(button: action)
        case .percent:
            percent()
        case .plusMinus:
            plusMinus()
        case .AC:
            self.isDecimal = false
            AC()
        case .equal:
            if result != nil && isOperation {
                self.isDecimal = false
                self.isOperation = false
                setOperation(self.operation!)
            }
        case .plus,.minus,.multiply,.divide:
           
            self.isDecimal = false
          
            if self.operation == nil {
                self.operation = action
            }

            if isOperation {
                setOperation(action)
                self.isOperation = false
            }
            self.operation = action
        }
    }
    
    
    mutating func setOperation(_ operation:CalculatorButton){
        switch self.operation {
        case .plus:

            if result != nil {
                result! += input
            }else{
                result = input
            }
            input = 0
            inputTitle = input.description
            self.screenTitle.value = formatter.string(from: NSNumber(value: result!))!
            break
        case .minus:
            if result != nil {
                result! -= input
            }else{
                result = input
            }
            input = 0
            inputTitle = input.description
            self.screenTitle.value = formatter.string(from: NSNumber(value: result!))!
            break
        case .multiply:
            if result != nil {
                result! *= input
            }else{
                result = input
            }
            input = 0
            inputTitle = input.description
            self.screenTitle.value = formatter.string(from: NSNumber(value: result!))!
            break
        case .divide:
            if result != nil {
                result! /= input
            }else{
                result = input
            }
            input = 0
            inputTitle = input.description
            self.screenTitle.value = formatter.string(from: NSNumber(value: result!))!
            break
        default:
            return
        }
    }
    
    //MARK: - Decimal
    mutating func decimal(button:CalculatorButton) {
        if !self.isDecimal {
            self.isDecimal = true
            self.screenTitle.value = formatter.string(from: NSNumber(value: self.input))! + button.rawValue
            if inputTitle != "0.0" {
                self.inputTitle = self.inputTitle + "."
            }else{
                self.inputTitle = "0."
            }
        }
    }
    
    //MARK: - NumberPress
    mutating func numberPress(button:CalculatorButton) {
        if self.isDecimal {
            if inputTitle == "0." {
                if button.rawValue == "0" {
                    self.inputTitle += button.rawValue
                    self.input = Double(self.inputTitle)!
                    self.screenTitle.value = "0,0"
                }else{
                    self.inputTitle += button.rawValue
                    self.input = Double(self.inputTitle)!
                    self.screenTitle.value = inputTitle.replacingOccurrences(of: ".", with: ",")
                }
            }else{
                if inputTitle.count <= 9 {
                    self.inputTitle = self.inputTitle + button.rawValue
                    self.input = Double(self.inputTitle)!
                    self.screenTitle.value = inputTitle.replacingOccurrences(of: ".", with: ",")
                }
            }
            
            self.isOperation = true
            return
        }else {
            if inputTitle != "0.0" {
                if inputTitle.count <= 8 {
                    self.inputTitle = self.inputTitle + button.rawValue
                }
            }else{
                self.inputTitle = button.rawValue
            }
        }
        self.isOperation = true
        self.input = Double(self.inputTitle)!
        self.inputTitle = input.description
        self.screenTitle.value = formatter.string(from: NSNumber(value: self.input))!
    }
    //MARK: - AC
    mutating func AC() {
        if formatter.string(from: NSNumber(value: result ?? 0))! == self.screenTitle.value {
            result = nil
            resultTitle = nil
            input = 0
            inputTitle = "0.0"
            screenTitle.value = "0"
            self.operation = nil
        }else if formatter.string(from: NSNumber(value: input))! == self.screenTitle.value {
            input = 0
            inputTitle = "0.0"
            screenTitle.value = "0"
        }
    }
    
    //MARK: - Percent
    mutating func percent() {
        if result != nil {
            self.result! /= 100
        }else{
            self.result = self.input/100
        }
        resultTitle = result?.description
        self.screenTitle.value = formatter.string(from: NSNumber(value: result!))!
    }
    
    //MARK: - PlusMinus
    mutating func plusMinus() {
        if formatter.string(from: NSNumber(value: result ?? 0))! == self.screenTitle.value {
            self.result! *= -1
           
            resultTitle = result?.description
            self.screenTitle.value = formatter.string(from: NSNumber(value: self.result!))!
            
        }else if formatter.string(from: NSNumber(value: input))! == self.screenTitle.value {
            self.input *= -1

            self.inputTitle = input.description
            self.screenTitle.value = formatter.string(from: NSNumber(value: self.input))!
        }
    }
}

extension CalculatorButtonListViewModel {

    func getDefaultCellModel(_ albumViewModelList:[CalculatorButtonViewModel]) -> [DefaultCellModel<CalculatorButtonViewModel>]{
        var cellModelList:[DefaultCellModel<CalculatorButtonViewModel>] = []

        albumViewModelList.forEach { (item) in
            cellModelList.append(DefaultCellModel((identifier: "calculatorCell", model: item)))
        }
        return cellModelList
    }
}


//MARK: - CalculatorButtonViewModel
struct CalculatorButtonViewModel {
    let calcultorButton:CalculatorButton
    
    init(_ button:CalculatorButton) {
        self.calcultorButton = button
    }
}

extension CalculatorButtonViewModel {
    
    var title:String {
        return calcultorButton.rawValue
    }
    
    var backgroundColor:UIColor {
        return calcultorButton.backgroundColor
    }
}
