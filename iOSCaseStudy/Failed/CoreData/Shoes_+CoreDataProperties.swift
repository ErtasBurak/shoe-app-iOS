//
//  Shoes_+CoreDataProperties.swift
//  iOSCaseStudy
//

//
//

import Foundation
import CoreData
import UIKit


extension Shoes_ {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Shoes_> {
        return NSFetchRequest<Shoes_>(entityName: "Shoes_")
    }

    @NSManaged public var product: String
    @NSManaged public var description_: String
    @NSManaged public var image: String
    @NSManaged public var price: String
    @NSManaged public var detaildescription: String

}

