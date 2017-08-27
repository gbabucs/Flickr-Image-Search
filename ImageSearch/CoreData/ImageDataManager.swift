//
//  ImageDataManager.swift
//  ImageSearch
//
//  Created by Babu Gangatharan on 8/26/17.
//  Copyright © 2017 Babu Gangatharan. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public class ImageDataManager {
    
    //MARK: Static
    
    public static let shared = ImageDataManager()
    
    //MARK: Functions
    
    /**
     Get Images from Core Data
     - returns: Array of images
     */
    
    func getImages() -> [SearchPhotos] {
        var photos = [SearchPhotos]()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {
                return photos
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = SearchPhotos.imageFetchRequest()
        
        do {
            let fetchedResults = try context.fetch(fetchRequest)
            
            for result in fetchedResults {
                guard let photo = result as? SearchPhotos else {
                    return photos
                }
                
                photos.append(photo)
            }
        } catch {
            fatalError("Unable read images")
        }
        
        return photos
    }
    
    /**
     Check if image is already present
     - parameter: Image id
     - returns: Bool
     */
    
    func isExist(id: Int) -> Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {
                return false
        }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = SearchPhotos.imageFetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "id = \(id)", argumentArray: nil)
        
        do {
            let res = try context.fetch(fetchRequest)
            
            return res.count > 0
        } catch {
            fatalError("Unable read images")
        }
    }
    
    /**
     Save image into Core data
     - parameters: Image id and UIImage
     - returns: Bool
     */
    
    func save(id:Int, image: UIImage, url: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {
                return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let photos = SearchPhotos(context: context)
        let newImageData = UIImageJPEGRepresentation(image,1)
        
        photos.setValue(id, forKey: "id")
        photos.setValue(newImageData, forKey: "imageData")
        photos.setValue(url, forKey: "url")
        
        do {
            try context.save()
        } catch {
            print("error")
        }
    }
    
}
