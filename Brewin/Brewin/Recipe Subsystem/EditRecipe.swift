//
//  EditRecipe.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 15.04.23.
//

import SwiftUI
import os

// Edit or add recipes 
// TODO: implement saving system
struct EditRecipe: View {
    @ObservedObject var recipeViewModel: RecipeViewModel
    @State var id: UUID?
    @ObservedObject var recipe: Recipe
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Name")) {
                    TextField("Recipe Name", text: $recipe.name)
                }
                Section(header: Text("Brewing Method")) {
                    Picker("Select a brewing method", selection: $recipe.brewingMethod) {
                        ForEach(BrewingMethod.allCases, id: \.id) { option in
                            if(option != .empty) {
                                Text(String(describing: option))
                            }
                        }
                    }
                }
                Section(header: Text("Instructions")) {
                    List {
                        ForEach(recipe.instructions, id: \.self) { instruction in
                        }
                    }
                    
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button(action: {recipe.instructions.append(Instruction.emptyInstruction())}) {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
    }
}


struct EditRecipe_Previews: PreviewProvider {
    static var previews: some View {
        EditRecipe(recipeViewModel: RecipeViewModel.mockRecipeViewModel(), id: UUID(), recipe: Recipe.emptyRecipe())
    }
}
