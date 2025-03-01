//
//  GrocceryItemsList.swift
//  GroceryListFromCourse
//
//  Created by Piotr Brus on 01/03/2025.
//
import SwiftData
import SwiftUI

struct GrocceryItemsList: View {
    //Mark: - Properties
    @ObservedObject var viewModel: GrocceryListViewModel
    let items: [Item]
    let modelContext: ModelContext

    //MARK: - Body
    var body: some View {
        List {
            ForEach(items) { item in
                Text(item.title)
                    .font(.title.weight(.light))
                    .padding(.vertical, 2)
                    .foregroundStyle(
                        item.isCompleted == false
                            ? Color.primary : Color.accentColor
                    )
                    .strikethrough(item.isCompleted)
                    .italic(item.isCompleted)
                    .swipeActions {
                        Button(role: .destructive) {
                            withAnimation {
                                modelContext.delete(item)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                    .swipeActions(edge: .leading) {
                        Button(
                            "Done",
                            systemImage: !item.isCompleted
                                ? "checkmark.circle" : "x.circle"
                        ) {
                            item.isCompleted.toggle()
                        }
                    }
            }
        }
    }
}
