import SwiftData
//
//  BottomPanel.swift
//  GroceryListFromCourse
//
//  Created by Piotr Brus on 01/03/2025.
//
import SwiftUI

struct BottomPanel: View {
    //MARK: - Properties
    @ObservedObject var viewModel: GrocceryListViewModel
    @FocusState private var isFocused: Bool

    let modelContext: ModelContext

    //MARK: - Body
    var body: some View {
        VStack {
            TextField("", text: $viewModel.item)
                .textFieldStyle(.plain)
                .padding(12)
                .background(.tertiary)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .font(.title.weight(.light))
                .focused($isFocused)

            Button {
                guard !viewModel.item.isEmpty else { return }

                let newItem = Item(
                    title: viewModel.item, isCompleted: false)
                modelContext.insert(newItem)
                viewModel.item = ""
                isFocused = false
            } label: {
                Text("Save")
                    .font(.title2.weight(.medium))
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle)
            .controlSize(.extraLarge)
        }
        .padding()
        .background(.bar)
    }
}
