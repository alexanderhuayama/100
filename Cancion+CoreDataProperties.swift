//
//  Cancion+CoreDataProperties.swift
//  
//
//  Created by Giovanni on 12/1/17.
//
//

import Foundation
import CoreData


extension Cancion {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cancion> {
        return NSFetchRequest<Cancion>(entityName: "Cancion")
    }

    @NSManaged public var artistId: Int32
    @NSManaged public var artistName: String?
    @NSManaged public var artworkUrl100: String?
    @NSManaged public var collectionPrice: String?

}
