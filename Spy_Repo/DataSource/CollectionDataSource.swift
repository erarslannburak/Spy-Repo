//
//  CollectionDataSource.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 12.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import Foundation
import UIKit

class CollectionDataSource<T:CellModelProvider>: NSObject, UICollectionViewDataSource {

    typealias ListCellConfigureBlock = (_ cell : UICollectionViewCell , _ item : T?, _ indexpath: IndexPath) -> Void

    public var configureCell: ListCellConfigureBlock?
    
    var items = Array<T>()
    
    init(_ item:[T]) {
        super.init()
        items = item
    }
    
    func updateItems(_ items: [T]) {
        self.items = items
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.items[indexPath.row].property?.identifier ?? "", for: indexPath)
        configureCell?(cell, self.items[indexPath.row], indexPath)
        return cell
    }
}
