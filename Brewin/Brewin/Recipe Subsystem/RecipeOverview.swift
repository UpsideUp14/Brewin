//
//  RecipeView.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 14.04.23.
//

import SwiftUI

struct RecipeOverview: View {
    @State private var isShowingSheet = false
    @ObservedObject var recipeViewModel: RecipeViewModel
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(recipeViewModel.recipes, id: \.self) { recipe in
                    NavigationLink(recipe.name, destination: EditRecipe(recipeViewModel: recipeViewModel, recipe: recipe))
                }
            }
                .navigationTitle("Recipes")
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button(action: {isShowingSheet.toggle()}) {
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $isShowingSheet, content: {
                            EditRecipe(recipeViewModel: recipeViewModel, recipe: Recipe.emptyRecipe())
                        })
                    }
                }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeOverview(recipeViewModel: RecipeViewModel.mockRecipeViewModel())
    }
}
