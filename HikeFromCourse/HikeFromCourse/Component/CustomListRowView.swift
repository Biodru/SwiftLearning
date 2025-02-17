//
//  CustomListRowView.swift
//  HikeFromCourse
//
//  Created by Piotr Brus on 11/02/2025.
//
import SwiftUI

struct CustomListRowView: View {
    // MARK: -PROPERTIES
    let setting: AppSetting

    var body: some View {
        LabeledContent {
            if setting.rowContent != nil {
                Text(setting.rowContent!)
                    .foregroundStyle(.primary)
                    .fontWeight(.heavy)
            } else if setting.rowLinkLabel != nil
                && setting.rowLinkDestination != nil
            {
                Link(
                    setting.rowLinkLabel!,
                    destination: URL(string: setting.rowLinkDestination!)!
                )
                .foregroundColor(.pink)
                .fontWeight(.heavy)
            } else {
                EmptyView()
            }
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(setting.rowTintColor)
                    Image(systemName: setting.rowIcon)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
                Text(setting.rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(
            setting: AppSetting(
                rowLabel: "Website",
                rowIcon: "globe",
                rowContent: nil,
                rowTintColor: .blue,
                rowLinkLabel: "Credo Academy",
                rowLinkDestination: "http://credo.academy"
            )
        )
    }
}
