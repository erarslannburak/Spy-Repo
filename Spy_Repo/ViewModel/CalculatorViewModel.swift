//
//  CalculatorViewModel.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 15.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorListViewModel {
    
    var itemList:[CalculatorViewModel] = [CalculatorViewModel(item: .AC, type: .symbol, color: .calculatorLightGreyColor),
                                          CalculatorViewModel(item: .inverse, type: .symbol, color: .calculatorLightGreyColor),
                                          CalculatorViewModel(item: .percent, type: .symbol, color: .calculatorLightGreyColor),
                                          CalculatorViewModel(item: .divide, type: .symbol, color: .calculatorOrangeColor),
                                          CalculatorViewModel(item: .seven, type: .number, color: .calculatorDarkGreyColor),
                                          CalculatorViewModel(item: .eight, type: .number, color: .calculatorDarkGreyColor),
                                          CalculatorViewModel(item: .nine, type: .number, color: .calculatorDarkGreyColor),
                                          CalculatorViewModel(item: .multiply, type: .symbol, color: .calculatorOrangeColor),
                                          CalculatorViewModel(item: .four, type: .number, color: .calculatorDarkGreyColor),
                                          CalculatorViewModel(item: .five, type: .number, color: .calculatorDarkGreyColor),
                                          CalculatorViewModel(item: .six, type: .number, color: .calculatorDarkGreyColor),
                                          CalculatorViewModel(item: .minus, type: .symbol, color: .calculatorOrangeColor),
                                          CalculatorViewModel(item: .one, type: .number, color: .calculatorDarkGreyColor),
                                          CalculatorViewModel(item: .two, type: .number, color: .calculatorDarkGreyColor),
                                          CalculatorViewModel(item: .three, type: .number, color: .calculatorDarkGreyColor),
                                          CalculatorViewModel(item: .plus, type: .symbol, color: .calculatorOrangeColor),
                                          CalculatorViewModel(item: .zero, type: .number, color: .calculatorDarkGreyColor),
                                          CalculatorViewModel(item: .point, type: .number, color: .calculatorDarkGreyColor),
                                          CalculatorViewModel(item: .equal, type: .symbol, color: .calculatorOrangeColor)]

    var datasource: CollectionDataSource<DefaultCellModel<CalculatorViewModel>>!
    
    
    init() {
        self.datasource = CollectionDataSource((self.getDefaultCellModel(itemList)))
    }

    func cellForItemAt(_ indexPath:IndexPath) -> CalculatorViewModel {
        return itemList[indexPath.row]
    }
    
}
extension CalculatorListViewModel {

    func getDefaultCellModel(_ albumViewModelList:[CalculatorViewModel]) -> [DefaultCellModel<CalculatorViewModel>]{
        var cellModelList:[DefaultCellModel<CalculatorViewModel>] = []

        albumViewModelList.forEach { (item) in
            cellModelList.append(DefaultCellModel((identifier: "calculatorCell", model: item)))
        }
        return cellModelList
    }
}





struct CalculatorViewModel {
    let item:Calculator
    let type:CalculatorButtonType
    let color:UIColor
}

extension CalculatorViewModel {
    var content:String {
        return item.rawValue
    }
}


