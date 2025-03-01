//
//  Item.swift
//  GroceryListFromCourse
//
//  Created by Piotr Brus on 18/02/2025.
//

import Foundation
import SwiftData

@Model
class Item {
    var title: String
    var isCompleted: Bool

    init(title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
