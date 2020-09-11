//
//  UICollectionView+Extension.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 11.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import Foundation
import UIKit
extension UICollectionView {
   
    func registerAlbumCell() {
        register(UINib(nibName: "AlbumCell", bundle: nil), forCellWithReuseIdentifier: "AlbumCell")
    }

    func registerPhotoCell() {
        register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCell")
    }

}
