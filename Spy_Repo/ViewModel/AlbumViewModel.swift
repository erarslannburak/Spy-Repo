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

    var datasource: CollectionDataSource<DefaultCellModel<AlbumViewModel>>!

    init() {
        let albumViewModelList = coreDataManager.fetchAllAlbums() ?? [AlbumViewModel]()
        self.datasource = CollectionDataSource((self.getDefaultCellModel(albumViewModelList.reversed())))
    }
}

extension AlbumListViewModel {
    
    mutating func addAlbum(name:String) {
        let albumViewModel = coreDataManager.insertAlbum(name: name)!
        datasource.items.insert(DefaultCellModel((identifier: "albumCell", model: albumViewModel)), at: 0)
    }
    
    func didSelectItemAt(_ indexPath:IndexPath) -> AlbumViewModel {
        return (datasource.items[indexPath.row].property?.model)!
    }
}

extension AlbumListViewModel {

    func getDefaultCellModel(_ albumViewModelList:[AlbumViewModel]) -> [DefaultCellModel<AlbumViewModel>]{
        var cellModelList:[DefaultCellModel<AlbumViewModel>] = []

        albumViewModelList.forEach { (item) in
            cellModelList.append(DefaultCellModel((identifier: "albumCell", model: item)))
        }
        return cellModelList
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
    
    var coverImage:Dynamic<String> {
        return album.coverImage
    }
}

extension AlbumViewModel {
    func fetchPhotos() -> PhotoListViewModel {
        return coreDataManager.fetchPhotos(parent: album.id)!
    }
    
    func updateCover(base64DataStr: String) {
        coreDataManager.update(coverImage: base64DataStr, id: album.id)
        album.coverImage.value = base64DataStr
    }
}
