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
    
    //MARK:  Properties
    
    let fetchRequest = SearchPhotos.imageFetchRequest()
    
    //MARK: Functions
    
    /**
     Get Images from Core Data
     - returns: Array of images
     */
    
    func getImages() -> [UIImage] {
        var images = [UIImage]()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {
                return images
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            let fetchedResults = try context.fetch(fetchRequest)
            
            for result in fetchedResults {
                guard let imageData =  (result as AnyObject).value(forKey: "imageData") as? Data,
                      let image =  UIImage(data: imageData)
                else {
                    return images
                }
                
                images.append(image)
            }
        } catch {
            fatalError("Unable read images")
        }
        
        return images
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
    
    func save(id:Int, image: UIImage) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {
                return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let photos = SearchPhotos(context: context)
        let newImageData = UIImageJPEGRepresentation(image,1)
        
        photos.setValue(id, forKey: "id")
        photos.setValue(newImageData, forKey: "imageData")
        
        do {
            try context.save()
        } catch {
            print("error")
        }
    }
    
}
