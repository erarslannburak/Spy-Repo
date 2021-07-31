//
//  Album.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 9.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import Foundation
import CoreData
//
//@objc(Album)
//public class Album: NSManagedObject {}
//
//extension Album {
//
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Album> {
//        return NSFetchRequest<Album>(entityName: "Album")
//    }
//
//    @NSManaged public var id: UUID
//    @NSManaged public var name: String
//    @NSManaged public var createDate: Date
//    @NSManaged public var coverImage: Data
//}
struct Album {
    let id:UUID
    let name:String
    let createDate:Date
    let coverImage:Dynamic<String>
    
    
    init(_ coreAlbum:CoreAlbum) {
        self.id = coreAlbum.id!
        self.name = coreAlbum.name!
        self.createDate = coreAlbum.createDate!
        self.coverImage = Dynamic(coreAlbum.coverImage!)
    }
}

