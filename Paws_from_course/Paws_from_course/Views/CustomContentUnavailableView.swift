//
//  CustomContentUnavailableView.swift
//  Paws_from_course
//
//  Created by Piotr Brus on 04/03/2025.
//

import SwiftUI

struct CustomContentUnavailableView: View {
    //MARK: - Properties
    var icon: String
    var title: String
    var description: String

    //MARK: - Body
    var body: some View {
        ContentUnavailableView {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 96)

            Text(title)
                .font(.title)
        } description: {
            Text(description)
        }
        .foregroundStyle(.tertiary)
    }
}

#Preview {
    CustomContentUnavailableView(
        icon: "cat.circle",
        title: "No photo",
        description: "Add a photo to get started."
    )
}
