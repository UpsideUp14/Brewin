//
//  EditRecipe.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 15.04.23.
//

import SwiftUI

struct EditRecipe: View {
    @ObservedObject var recipeViewModel: RecipeViewModel
    @State var id: UUID?
    @ObservedObject var recipe: Recipe

    
    var body: some View {
        /*
        if let index = recipeViewModel.recipes.firstIndex(where: {$0.id == id}) {
            recipe = recipeViewModel.recipes[index]
        } else {
           // item could not be found
        }
         */
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
                            /*
                            HStack {
                                TextField("Instruction", text: instruction.$message)
                                TextField("Time", value: 0, format: .number)
                                    .keyboardType(.decimalPad)
                                    .frame(width: 40)
                            }
                             */
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
        EditRecipe(recipeViewModel: RecipeViewModel.mockRecipeViewModel(),id: nil, recipe: Recipe.emptyRecipe())
    }
}
