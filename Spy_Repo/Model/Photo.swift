//
//  Photo.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 9.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import Foundation
import CoreData

struct Photo {
    let id:UUID
    let parentId:UUID
    let image:Data
    let date:Date
    
    
    init(_ corePhoto:CorePhoto) {
        self.id = corePhoto.id!
        self.parentId = corePhoto.parentId!
        self.date = corePhoto.date!
        self.image = corePhoto.image!
    }
}
