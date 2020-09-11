//
//  AlbumViewModel.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 10.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import Foundation
import UIKit
import CoreData

let coreDataManager = CoreDataManager.shared

struct AlbumListViewModel {
    var albumViewModelList:[AlbumViewModel]
}

extension AlbumListViewModel {
    
    mutating func addAlbum(name:String) {
        let album = coreDataManager.insertAlbum(name: name)!
        albumViewModelList.append(AlbumViewModel(album))
    }
    
    mutating func fetchAlbums() {
        let albumList = coreDataManager.fetchAllAlbums() ?? [Album]()
        
        for album in albumList {
            albumViewModelList.append(AlbumViewModel(album))
        }
    }
    
    func numberOfItemsInSection() -> Int {
        return albumViewModelList.count
    }
    
    func cellForItemAt(_ indexPath:IndexPath) -> AlbumViewModel {
        return albumViewModelList[indexPath.row]
    }
}



struct AlbumViewModel {
    var album:Album
    
    init(_ album:Album) {
        self.album = album
    }
}

extension AlbumViewModel {
    
    var id:UUID {
        return album.id
    }
    
    var name:String {
        return album.name
    }
    
    var date:Date {
        return album.createDate
    }
    
    var coverImage:Data {
        return album.coverImage
    }
}

extension AlbumViewModel {
    func fetchPhotos() -> PhotoListViewModel {
        return coreDataManager.fetchPhotos(parent: album.id)!
    }    
}
