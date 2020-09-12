//
//  Dynamic.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 12.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//
import Foundation


class Dynamic<T> : NSObject{
    
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        self.listener?(self.value)
    }
    
    init(_ value: T) {
        self.value = value
    }
}


