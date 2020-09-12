//
//  DataSourceProtocols.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 12.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import Foundation
import UIKit

protocol CellModelProvider {
    
    typealias Property = (identifier: String, model: CellModelType?)
    
    associatedtype CellModelType
    
    var property: Property? { get set }

    
    init(_ _property: Property?)
}

class DefaultCellModel<T>: CellModelProvider {
    
    typealias CellModelType = T
    
    var property: (identifier: String, model: T?)?
    
    required init(_ _property: (identifier: String, model: T?)?) {
        property = _property
    }
    
}
