//
//  Paws_from_courseApp.swift
//  Paws_from_course
//
//  Created by Piotr Brus on 04/03/2025.
//

import SwiftData
import SwiftUI

@main
struct Paws_from_courseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Pet.self)
        }
    }
}
