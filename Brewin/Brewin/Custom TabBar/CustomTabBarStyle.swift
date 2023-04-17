//
//  CustomTabBarStyle.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 16.04.23.
//

import SwiftUI
import TabBar

// Tab bar customization for package TabBar
struct CustomTabBarStyle: TabBarStyle {
    public func tabBar(with geometry: GeometryProxy, itemsContainer: @escaping () -> AnyView) -> some View {
        itemsContainer()
            .background(Color("color.tab.bar.background"))
            .cornerRadius(25.0)
            .frame(height: 55.0)
            .padding(.horizontal, 64.0)
            .padding(.bottom, 16.0 + geometry.safeAreaInsets.bottom)
            .offset(x: -10)
    }
}
