//
//  RecipeOverview.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 13.04.23.
//

import Foundation

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe]
    
    init(recipes: [Recipe]) {
        self.recipes = recipes
    }
}
