//
//  CardView.swift
//  HikeFromCourse
//
//  Created by Piotr Brus on 28/01/2025.
//
import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES

    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false

    // MARK: - FUNCTIONS

    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        imageNumber = randomNumber
    }
    var body: some View {
        // MARK: - CARD
        ZStack {
            CustomBackgroundView()
            VStack {
                // MARK: - HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        .colorGrayLight,
                                        .colorGrayMedium,
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom)
                            )
                        Spacer()
                        Button {
                            // ACTION: Show a sheet
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([
                                    .medium, .large,
                                ])
                        }
                    }
                    Text(
                        "Fun and enjoyable outdoor activity for friends and families."
                    )
                    .multilineTextAlignment(.leading)
                    .italic()
                    .foregroundStyle(.colorGrayMedium)
                }
                .padding(.horizontal, 32)
                // MARK: - MAIN CONTENT
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut(duration: 0.35), value: imageNumber)
                }
                // MARK: - FOOTER
                Button {
                    // ACTION: Generate random number
                    randomImage()
                } label: {
                    Text("Explore more")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .colorGreenLight,
                                    .colorGreenMedium,
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(
                            color:
                                .black.opacity(0.25),
                            radius: 0.25, x: 1, y: 2
                        )
                }
                .buttonStyle(GradientButtonStyle())
            }
        }
        .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
