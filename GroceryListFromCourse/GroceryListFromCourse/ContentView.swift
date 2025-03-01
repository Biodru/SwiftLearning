//
//  ContentView.swift
//  GroceryListFromCourse
//
//  Created by Piotr Brus on 18/02/2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    @StateObject private var viewModel = GrocceryListViewModel()

    //MARK: - Methods

    init() {
        viewModel.setupTips()
    }

    //MARK: - Body
    var body: some View {
        NavigationStack {
            GrocceryItemsList(
                viewModel: viewModel,
                items: items,
                modelContext: modelContext
            )
            .navigationTitle("Grocery List")
            .toolbar {
                if items.isEmpty {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            viewModel.addEssentialFoods(
                                modelContext: modelContext)
                        } label: {
                            Image(systemName: "carrot")
                        }
                        .popoverTip(viewModel.buttonTip)
                    }
                }
            }
            .overlay {
                if items.isEmpty {
                    ContentUnavailableView(
                        "Empty Cart", systemImage: "cart.circle",
                        description: Text(
                            "Add some items to the shopping list."))
                }
            }
            .safeAreaInset(edge: .bottom) {
                BottomPanel(viewModel: viewModel, modelContext: modelContext)
            }
        }
    }
}

#Preview("Sample Data") {
    let sampleData: [Item] = [
        Item(title: "Bakery & Bread", isCompleted: false),
        Item(title: "Meat & Seafood", isCompleted: true),
        Item(title: "Cereals", isCompleted: .random()),
        Item(title: "Pasta & Rice", isCompleted: .random()),
    ]

    let container = try! ModelContainer(
        for: Item.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true))

    for item in sampleData {
        container.mainContext.insert(item)
    }
    return ContentView()
        .modelContainer(container)
}

#Preview("Empty list") {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
