//
//  Address+CoreDataProperties.swift
//  FastFoodApp
//
//  Created by Adrian Szymczyk on 16/06/2022.
//
//

import Foundation
import CoreData


extension Address {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Address> {
        return NSFetchRequest<Address>(entityName: "Address")
    }

    @NSManaged public var street: String?
    @NSManaged public var flatNumber: String?
    @NSManaged public var houseNumber: String?
    @NSManaged public var city: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var basket: NSSet?
    
    public var productArray: [Product] {
        let set = basket as? Set<Product> ?? []

        return set.sorted{
            $0.name! < $1.name!
        }
    }

}

// MARK: Generated accessors for basket
extension Address {

    @objc(addBasketObject:)
    @NSManaged public func addToBasket(_ value: Product)

    @objc(removeBasketObject:)
    @NSManaged public func removeFromBasket(_ value: Product)

    @objc(addBasket:)
    @NSManaged public func addToBasket(_ values: NSSet)

    @objc(removeBasket:)
    @NSManaged public func removeFromBasket(_ values: NSSet)

}

extension Address : Identifiable {

}
