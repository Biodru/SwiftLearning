//
//  GradientButtonStyle.swift
//  HikeFromCourse
//
//  Created by Piotr Brus on 30/01/2025.
//
import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // Conditional statement
                configuration.isPressed
                    ? LinearGradient(
                        colors: [
                            .colorGrayMedium,
                            .colorGrayLight,
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    : LinearGradient(
                        colors: [
                            .colorGrayLight,
                            .colorGrayMedium,
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
            )
            .clipShape(RoundedRectangle(cornerRadius: 40))
    }
}
