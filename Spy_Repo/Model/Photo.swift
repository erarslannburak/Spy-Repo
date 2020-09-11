//
//  Photo.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 9.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import Foundation
import CoreData

@objc(Photo)
public class Photo: NSManagedObject {}

extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var id: UUID
    @NSManaged public var parentId: UUID
    @NSManaged public var image: Data
    @NSManaged public var date: Date
    
}
