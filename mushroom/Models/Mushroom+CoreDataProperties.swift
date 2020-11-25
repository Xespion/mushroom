//
//  Mushroom+CoreDataProperties.swift
//  mushroom
//
//  Created by Alex on 25/11/2020.
//  Copyright © 2020 Alex. All rights reserved.
//
//

import Foundation
import CoreData


extension Mushroom {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mushroom> {
        return NSFetchRequest<Mushroom>(entityName: "Mushroom")
    }

    @NSManaged public var lower: String?
    @NSManaged public var odor: String?
    @NSManaged public var rings: Int64
    @NSManaged public var spore: String?
    @NSManaged public var type: Bool
    @NSManaged public var upper: String?
    @NSManaged public var fBuser: User?

}
