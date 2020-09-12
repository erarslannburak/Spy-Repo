//
//  ReusableCell.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 12.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//
import Foundation

protocol ReusableCell {
    
    associatedtype T : CellModelProvider
    
    static var identfier: String { get }
    var item: T? { get set }
}

extension ReusableCell {
    static var identfier: String {
        return String.init(describing: self)
    }
}
