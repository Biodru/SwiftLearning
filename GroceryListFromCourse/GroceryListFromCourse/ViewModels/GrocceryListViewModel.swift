//
//  GrocceryListViewModel.swift
//  GroceryListFromCourse
//
//  Created by Piotr Brus on 01/03/2025.
//

import Foundation
import SwiftData
import SwiftUI
import TipKit

class GrocceryListViewModel: ObservableObject {
    // MARK: - Properties

    @Published var item: String = ""

    let buttonTip = ButtonTip()

    func addEssentialFoods(modelContext: ModelContext) {
        modelContext.insert(Item(title: "Bakery & Bread", isCompleted: false))
        modelContext.insert(Item(title: "Meat & Seafood", isCompleted: true))
        modelContext.insert(Item(title: "Cereals", isCompleted: .random()))
        modelContext.insert(Item(title: "Pasta & Rice", isCompleted: .random()))
    }

    func setupTips() {
        do {
            try Tips.resetDatastore()
            Tips.showAllTipsForTesting()
            try Tips.configure([
                .displayFrequency(.immediate)
            ])
        } catch {
            print("Error initializing TipKit \(error.localizedDescription)")
        }
    }
}
