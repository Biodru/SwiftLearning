//
//  AppSetting.swift
//  HikeFromCourse
//
//  Created by Piotr Brus on 12/02/2025.
//
import SwiftUI

struct AppSetting: Hashable {
    var rowLabel: String
    var rowIcon: String
    var rowContent: String? = nil
    var rowTintColor: Color
    var rowLinkLabel: String? = nil
    var rowLinkDestination: String? = nil
}
