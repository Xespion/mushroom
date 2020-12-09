//
//  User+CoreDataProperties.swift
//  mushroom
//
//  Created by Alex on 09/12/2020.
//  Copyright © 2020 Alex. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var image: NSData?
    @NSManaged public var mail: String?
    @NSManaged public var password: String?
    @NSManaged public var username: String?
    @NSManaged public var setas: NSSet?
    @NSManaged public var userInList: ListaUsers?

}

// MARK: Generated accessors for setas
extension User {

    @objc(addSetasObject:)
    @NSManaged public func addToSetas(_ value: Mushroom)

    @objc(removeSetasObject:)
    @NSManaged public func removeFromSetas(_ value: Mushroom)

    @objc(addSetas:)
    @NSManaged public func addToSetas(_ values: NSSet)

    @objc(removeSetas:)
    @NSManaged public func removeFromSetas(_ values: NSSet)

}
