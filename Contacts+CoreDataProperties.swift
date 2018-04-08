//
//  Contacts+CoreDataProperties.swift
//  contacts
//
//  Created by Young Hyub Yun on 2018. 4. 8..
//  Copyright © 2018년 YoungHyupYun. All rights reserved.
//
//

import Foundation
import CoreData


extension Contacts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contacts> {
        return NSFetchRequest<Contacts>(entityName: "Contacts")
    }

    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var address: String?

}
