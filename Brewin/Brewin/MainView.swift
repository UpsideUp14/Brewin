//
//  MainView.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 15.04.23.
//

import SwiftUI
import TabBar


struct MainView: View {
    private var recipeViewModel: RecipeViewModel = RecipeViewModel.mockRecipeViewModel()
    private var beansViewModel: BeansViewModel = BeansViewModel.mockBeansViewModel()
    private var logViewModel: LogViewModel = LogViewModel.mockLogViewModel()
    @State private var selection: Item = .second
    
    var body: some View {
        TabBar(selection: $selection) {
            RecipeOverview(recipeViewModel: recipeViewModel)
                .tabItem(for: Item.first)
            BrewinView(recipeViewModel: recipeViewModel, beansViewModel: beansViewModel, logViewModel: logViewModel)
                .tabItem(for: Item.second)
            BeansOverview(beansViewModel: beansViewModel)
                .tabItem (for: Item.third)
        }
        .tabBar(style: CustomTabBarStyle())
        .tabItem(style: CustomTabItemStyle())
    }
}

enum Item: Int, Tabbable {
    case first = 0
    case second
    case third
    
    var title: String {
        switch self {
            case .first:
                return "Recipes"// Name of icon of first item.
            case .second:
                return "Brew"// Name of icon of second item.
            case .third:
                return "Beans"// Name of icon of third item.
        }
    }
    
    var icon: String {
        switch self {
            case .first:
                return "drop.fill"// Title of first item.
            case .second:
                return "mug.fill"// Title of second item.
            case .third:
                return "leaf.fill"// Title of third item.
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
