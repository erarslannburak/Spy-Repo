//
//  PhotoViewModel.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 10.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import Foundation
import UIKit

struct PhotoListViewModel {
    var photoViewModelList:[PhotoViewModel]
    
    init(_ photoViewModel:[PhotoViewModel]) {
        photoViewModelList = photoViewModel
    }
}

extension PhotoListViewModel {
    
    mutating func add(image:UIImage) {
        photoViewModelList.append(PhotoViewModel(Photo(image: image, date: Date())))
    }
    
    func numberOfItemsInSection() -> Int {
        return photoViewModelList.count
    }
    
    func cellForItemAt(_ indexPath:IndexPath) -> PhotoViewModel {
        return photoViewModelList[indexPath.row]
    }
}

struct PhotoViewModel {
 
    var photo:Photo
    
    init(_ photo:Photo) {
        self.photo = photo
    }
}

extension PhotoViewModel {
    var image:UIImage {
        return photo.image
    }
    
    var date:Date {
        return photo.date
    }
}
