//
//  CustomTabItemStyle.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 16.04.23.
//

import SwiftUI
import TabBar

// Tab bar items customization for package: (TabBar)
struct CustomTabItemStyle: TabItemStyle {
    public func tabItem(icon: String, title: String, isSelected: Bool) -> some View {
        ZStack {
            if isSelected {
                Circle()
                    .foregroundColor(.blue)
                    .offset(y: -10)
                    .frame(width: 40.0, height: 40.0)
            }
            VStack {
                Image(systemName: icon)
                    .foregroundColor(isSelected ? .white : Color("color.tab.item.foreground"))
                    .frame(width: 32.0, height: 25)
                Text(title)
                    .foregroundColor(isSelected ? .blue : Color("color.tab.item.foreground"))
                    .frame(width: 90, height: 13)
                    .font(.system(size: 15))
            }

        }
        .padding(.vertical, 15.0)
    }
}
