//
//  Product+CoreDataProperties.swift
//  FastFoodApp
//
//  Created by Adrian Szymczyk on 15/06/2022.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var name: String?
    @NSManaged public var descriptionn: String?
    @NSManaged public var img: String?
    @NSManaged public var price: Double
    @NSManaged public var category: Category?

}

extension Product : Identifiable {

}
