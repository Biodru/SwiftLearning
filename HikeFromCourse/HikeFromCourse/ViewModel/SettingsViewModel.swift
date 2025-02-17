//
//  SettingsViewModel.swift
//  HikeFromCourse
//
//  Created by Piotr Brus on 12/02/2025.
//
import SwiftUI

class SettingsViewModel: ObservableObject {
    let settings: [AppSetting] = [
        AppSetting(
            rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE",
            rowTintColor: .blue),
        AppSetting(
            rowLabel: "Compatibility", rowIcon: "info.circle",
            rowContent: "iOS, iPadOS", rowTintColor: .red),
        AppSetting(
            rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift",
            rowTintColor: .orange),
        AppSetting(
            rowLabel: "Version", rowIcon: "gear", rowContent: "1.0",
            rowTintColor: .purple),
        AppSetting(
            rowLabel: "Developer", rowIcon: "ellipsis.curlybraces",
            rowContent: "John Doe", rowTintColor: .mint),
        AppSetting(
            rowLabel: "Designer", rowIcon: "paintpalette",
            rowContent: "Robert Petras", rowTintColor: .pink),
        AppSetting(
            rowLabel: "Website",
            rowIcon: "globe",
            rowContent: nil,
            rowTintColor: .indigo,
            rowLinkLabel: "Credo Academy",
            rowLinkDestination: "http://credo.academy"),

    ]
    
    let alternateAppIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Campfire",
        "AppIcon-Backpack",
    ]
}
