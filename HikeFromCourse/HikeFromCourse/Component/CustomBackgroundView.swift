//
//  CustomBackgroundView.swift
//  HikeFromCourse
//
//  Created by Piotr Brus on 28/01/2025.
//
import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {

            // MARK: - 3. DEPTH
            Color.colorGreenDark
                .cornerRadius(40)
                .offset(y: 12)

            // MARK: - 2. LIGHT
            Color.colorGrayLight
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)
            
            // MARK: - 1. SURFACE
            LinearGradient(
                colors: [
                    Color.colorGreenLight,
                    Color.colorGreenMedium,
                ], startPoint: .top,
                endPoint: .bottom
            )
            .cornerRadius(40)
        }
    }
}

struct CustomBackground_Preview: PreviewProvider {
    static var previews: some View {
        CustomBackgroundView()
            .padding()
    }
}
