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
    
    var datasource: CollectionDataSource<DefaultCellModel<PhotoViewModel>>!

    init(_ photoViewModelList:[PhotoViewModel]) {
        self.datasource = CollectionDataSource((self.getDefaultCellModel(photoViewModelList.reversed())))
    }
}

extension PhotoListViewModel {
    
    mutating func addPhoto(data:Data, parent:UUID) {
        self.datasource.items.insert(DefaultCellModel((identifier: "photoCell", model: coreDataManager.insertPhoto(data: data, parent: parent))), at: 0)
    }
    
    func didSelectItemAt(_ indexPath:IndexPath) -> PhotoViewModel {
        return (datasource.items[indexPath.row].property?.model)!
    }
}

extension PhotoListViewModel {

    func getDefaultCellModel(_ photoViewModelList:[PhotoViewModel]) -> [DefaultCellModel<PhotoViewModel>]{
        var cellModelList:[DefaultCellModel<PhotoViewModel>] = []

        photoViewModelList.forEach { (item) in
            cellModelList.append(DefaultCellModel((identifier: "photoCell", model: item)))
        }
        return cellModelList
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
