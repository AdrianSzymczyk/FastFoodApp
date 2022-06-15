//
//  Category+CoreDataProperties.swift
//  FastFoodApp
//
//  Created by Adrian Szymczyk on 15/06/2022.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var name: String?
    @NSManaged public var product: NSSet?
    
    public var productArray: [Product] {
        let set = product as? Set<Product> ?? []

        return set.sorted{
            $0.name! < $1.name!
        }
    }

}

// MARK: Generated accessors for product
extension Category {

    @objc(addProductObject:)
    @NSManaged public func addToProduct(_ value: Product)

    @objc(removeProductObject:)
    @NSManaged public func removeFromProduct(_ value: Product)

    @objc(addProduct:)
    @NSManaged public func addToProduct(_ values: NSSet)

    @objc(removeProduct:)
    @NSManaged public func removeFromProduct(_ values: NSSet)

}

extension Category : Identifiable {

}
