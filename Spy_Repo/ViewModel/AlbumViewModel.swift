//
//  AlbumViewModel.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 10.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import Foundation

struct AlbumListViewModel {
    var albumViewModelList:[AlbumViewModel]
}

extension AlbumListViewModel {
    
    mutating func add(name:String) {
        albumViewModelList.append(AlbumViewModel(Album(name: name, createDate: Date())))
    }
    
    func numberOfItemsInSection() -> Int {
        return albumViewModelList.count
    }
    
    func cellForItemAt(_ indexPath:IndexPath) -> AlbumViewModel {
        return albumViewModelList[indexPath.row]
    }
}



struct AlbumViewModel {
    let album:Album
    
    init(_ album:Album) {
        self.album = album
    }
}

extension AlbumViewModel {
    var name:String {
        return album.name
    }
    
    var date:Date {
        return album.createDate
    }
    
    var collection:Array<Photo>? {
        return album.collection
    }
    
    var photoListVM:PhotoListViewModel? {
        
        guard album.collection != nil else {return nil}
        
        var photoVM:[PhotoViewModel] = []
        
        for photo in album.collection! {
            photoVM.append(PhotoViewModel(photo))
        }
        
        return PhotoListViewModel(photoVM)
    }
}
