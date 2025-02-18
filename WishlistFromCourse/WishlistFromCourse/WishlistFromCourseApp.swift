//
//  WishlistFromCourseApp.swift
//  WishlistFromCourse
//
//  Created by Piotr Brus on 18/02/2025.
//

import SwiftData
import SwiftUI

@main
struct WishlistFromCourseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Wish.self)
        }
    }
}
