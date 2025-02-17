//
//  SettingsView.swift
//  HikeFromCourse
//
//  Created by Piotr Brus on 03/02/2025.
//
import SwiftUI

struct SettingsView: View {
    //MARK: - PROPERTIES

    @StateObject var viewModel: SettingsViewModel = SettingsViewModel()

    var body: some View {
        List {
            // MARK: - SECTION: HEADER
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))

                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editors' choice")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .colorGreenLight,
                            .colorGreenMedium,
                            .colorGreenDark,
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(.top, 8)

                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)

                    Text(
                        "The hike which looks gorgeus in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app."
                    )
                    .font(.footnote)
                    .italic()

                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundStyle(.colorGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)

            // MARK: - SECTION: ICONS

            Section(header: Text("Alternate Icons")) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(viewModel.alternateAppIcons, id: \.self) {
                            item in
                            Button {
                                UIApplication.shared.setAlternateIconName(item)
                                { error in
                                    if let error {
                                        print("Error: \(error.localizedDescription)")
                                    }
                                }
                            } label: {
                                Image(item)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                }
                .padding(.top, 12)
                Text(
                    "Choose your favourite app icon from the collection above."
                )
                .frame(minWidth: 0, maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .font(.footnote)
                .padding(.bottom, 12)
            }
            .listRowSeparator(.hidden)

            // MARK: - SECTION: ABOUT

            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack {
                    Spacer()
                    Text("Copyright ® All right reserved.")
                    Spacer()
                }
                .padding(.vertical, 8)
            ) {
                ForEach(viewModel.settings, id: \.self) {
                    setting in
                    CustomListRowView(setting: setting)
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
