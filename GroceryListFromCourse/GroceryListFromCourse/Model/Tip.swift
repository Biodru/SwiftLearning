//
//  Tip.swift
//  GroceryListFromCourse
//
//  Created by Piotr Brus on 01/03/2025.
//

import Foundation
import TipKit

struct ButtonTip: Tip {
    var title: Text = Text("Essential foods")
    var message: Text? = Text("Add some everyday items to the shopping list.")
    var image: Image? = Image(systemName: "info.circle")
}
