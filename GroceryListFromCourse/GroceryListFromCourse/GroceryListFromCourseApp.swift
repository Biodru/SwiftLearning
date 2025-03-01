//
//  GroceryListFromCourseApp.swift
//  GroceryListFromCourse
//
//  Created by Piotr Brus on 18/02/2025.
//

import SwiftData
import SwiftUI

@main
struct GroceryListFromCourseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Item.self)
        }
    }
}
