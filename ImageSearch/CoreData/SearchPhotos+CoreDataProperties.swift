//
//  SearchPhotos+CoreDataProperties.swift
//  
//
//  Created by Babu Gangatharan on 8/26/17.
//
//

import Foundation
import CoreData


extension SearchPhotos {

    @nonobjc public class func imageFetchRequest() -> NSFetchRequest<SearchPhotos> {
        return NSFetchRequest<SearchPhotos>(entityName: "SearchPhotos")
    }

    @NSManaged public var id: Int64
    @NSManaged public var imageData: NSData?

}
