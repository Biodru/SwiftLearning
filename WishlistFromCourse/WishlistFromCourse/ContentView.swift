//
//  ContentView.swift
//  WishlistFromCourse
//
//  Created by Piotr Brus on 18/02/2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]

    @State private var isAlertShowing: Bool = false
    @State private var title: String = ""

    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(wish)
                            }
                        }
                }
            }
            .navigationTitle("Whishlist")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAlertShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }

                if !wishes.isEmpty {
                    ToolbarItem(placement: .bottomBar) {
                        Text(
                            "\(wishes.count) wish\(wishes.count > 1 ? "es" : "")"
                        )
                    }
                }
            }
            .alert("Create a new wish", isPresented: $isAlertShowing) {
                TextField("Enter a wish", text: $title)

                Button {
                    modelContext.insert(Wish(title: title))
                    title = ""
                } label: {
                    Text("Save")
                }
            }
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView(
                        "My Whishlist", systemImage: "heart.circle",
                        description: Text(
                            "No whishes yet. Add one to get started"))
                }
            }
        }
    }
}

#Preview("Sample Data") {
    let container = try! ModelContainer(
        for: Wish.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true))

    container.mainContext.insert(Wish(title: "Buy Mazda 6 estate"))
    container.mainContext.insert(Wish(title: "Finish house"))

    return ContentView()
        .modelContainer(container)
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}
