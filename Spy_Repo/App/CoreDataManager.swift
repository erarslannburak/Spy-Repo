//
//  CoreDataManager.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 11.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    static let shared = CoreDataManager()
    private init() {}
    
    
   // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Spy_Repo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - Insert Album
    func insertAlbum(name:String) -> Album? {
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Album",in: managedContext)!
        
        
        let album = NSManagedObject(entity: entity,
        insertInto: managedContext)
        
        album.setValue(name, forKey: "name")
        album.setValue(Date(), forKey: "createDate")
        album.setValue(UUID(), forKey: "id")
        album.setValue(UIImage(named: "art")?.jpegData(compressionQuality: 0.5), forKey: "coverImage")
        
        do {
          try managedContext.save()
          return album as? Album
        } catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
          return nil
        }
    }
    
    // MARK: - Update Album Cover Image
    func update(coverImage:Data, album : Album) {
    
        let context = CoreDataManager.shared.persistentContainer.viewContext
       
        do {
            album.setValue(coverImage, forKey: "coverImage")
            do {
                try context.save()
                print("saved!")
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            } catch {
           
            }
        }
    }
    
    //MARK: - Delete Album
    
    func delete(album:Album) {
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext

        do {
          
          managedContext.delete(album)
          
        }
        do {
          try managedContext.save()
        } catch {
            print(error)
        }
    }
    
    //MARK: - Get All Album
    func fetchAllAlbums() -> [Album]?{
        
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Album")

        do {
            let album = try managedContext.fetch(fetchRequest)
            return (album as? [Album])
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    // MARK: - Insert Album
    func insertPhoto(data:Data,parent:UUID) -> PhotoViewModel? {
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Photo",in: managedContext)!
                
        let photo = NSManagedObject(entity: entity,
        insertInto: managedContext)

        photo.setValue(UUID(), forKey: "id")
        photo.setValue(parent, forKey: "parentId")
        photo.setValue(Date(), forKey: "date")
        photo.setValue(data, forKey: "image")
    
        do {
          try managedContext.save()
          return PhotoViewModel(photo as! Photo)
        } catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
          return nil
        }
    }
    
    //MARK: - Get Photos
    func fetchPhotos(parent:UUID) -> PhotoListViewModel? {
        
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Photo")
        fetchRequest.predicate = NSPredicate(format: "parentId == %@", parent as CVarArg)
        
        do {
            let photo = try managedContext.fetch(fetchRequest)
            return PhotoListViewModel(photo as! [Photo])
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
}
