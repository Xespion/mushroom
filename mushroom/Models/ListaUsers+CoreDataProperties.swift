//
//  ListaUsers+CoreDataProperties.swift
//  mushroom
//
//  Created by Alex on 09/12/2020.
//  Copyright © 2020 Alex. All rights reserved.
//
//

import Foundation
import CoreData


extension ListaUsers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ListaUsers> {
        return NSFetchRequest<ListaUsers>(entityName: "ListaUsers")
    }

    @NSManaged public var lista: NSSet?

}

// MARK: Generated accessors for lista
extension ListaUsers {

    @objc(addListaObject:)
    @NSManaged public func addToLista(_ value: User)

    @objc(removeListaObject:)
    @NSManaged public func removeFromLista(_ value: User)

    @objc(addLista:)
    @NSManaged public func addToLista(_ values: NSSet)

    @objc(removeLista:)
    @NSManaged public func removeFromLista(_ values: NSSet)

}
