//
//  MotionAnimationView.swift
//  HikeFromCourse
//
//  Created by Piotr Brus on 30/01/2025.
//
import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPERTIES
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false

    // MARK: - Functions
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 4...80)
    }
    
    func randomScale() -> CGFloat {
        return CGFloat.random(in: 0.1...2)
    }
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1)
    }
    
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }

    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundStyle(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x: randomCoordinate(),
                        y: randomCoordinate()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ) {
                            isAnimating = true
                        }
                    }
            }
        }
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    ZStack {
        MotionAnimationView()
            .background(
                Circle()
                    .fill(.teal)
            )
    }
}
