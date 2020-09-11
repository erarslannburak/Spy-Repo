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
    
    var photoViewModelList:[PhotoViewModel] = []
    
    init(_ photos:[Photo]) {
        for photo in photos {
            self.photoViewModelList.append(PhotoViewModel(photo))
        }
    }
}

extension PhotoListViewModel {
    
    mutating func addPhoto(data:Data, parent:UUID) {
        photoViewModelList.insert(coreDataManager.insertPhoto(data: data, parent: parent)!, at: 0)
    }
    
    func numberOfItemsInSection() -> Int {
        return photoViewModelList.count
    }
    
    func cellForItemAt(_ indexPath:IndexPath) -> PhotoViewModel {
        return photoViewModelList[indexPath.row]
    }
}

struct PhotoViewModel {
 
    private let photo:Photo
    
    init(_ photo:Photo) {
        self.photo = photo
    }
}

extension PhotoViewModel {
   
    var id:UUID {
        return photo.id
    }
    
    var parentId:UUID {
        return photo.parentId
    }
    
    var image:Data {
        return photo.image
    }
    
    var date:Date {
        return photo.date
    }
}
