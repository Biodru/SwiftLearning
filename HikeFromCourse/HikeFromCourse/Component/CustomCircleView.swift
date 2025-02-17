//
//  CustomCircleView.swift
//  HikeFromCourse
//
//  Created by Piotr Brus on 30/01/2025.
//
import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimating: Bool = false
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .colorIndigoMedium,
                            .colorSalmonLight,
                        ],
                        startPoint: isAnimating ? .topLeading : .bottomLeading,
                        endPoint: isAnimating ? .bottomTrailing : .topTrailing
                    )
                )
                .onAppear {
                    withAnimation(
                        .linear(duration: 3).repeatForever(autoreverses: true)
                    ) {
                        isAnimating.toggle()
                    }
                }
            MotionAnimationView()
        }
        .frame(width: 256, height: 256)

    }
}

#Preview {
    CustomCircleView()
}
