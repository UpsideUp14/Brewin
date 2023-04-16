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
    
    public static func mockRecipeViewModel() -> RecipeViewModel {
        let chemexInstructionId = UUID()
        let chemexInstructionTime: TimeInterval = 60
        let chemexRecipeInstruction = Instruction(id: chemexInstructionId, message: "Pour 150ml of water into kettle", time: chemexInstructionTime)
        let v60InstructionId = UUID()
        let v60InstructionTime: TimeInterval = 90
        let v60RecipeInstruction = Instruction(id: v60InstructionId, message: "Put filter into V60", time: v60InstructionTime)
        
        let chemexRecipeId = UUID()
        let chemexRecipe = Recipe(id: chemexRecipeId, name: "Chemex Recipe", method: .chemex, instructions: [chemexRecipeInstruction])
        let v60RecipeId = UUID()
        let v60Recipe = Recipe(id: v60RecipeId, name: "V60 Recipe", method: .v60, instructions: [v60RecipeInstruction])
        
        let recipes = [chemexRecipe, v60Recipe]
        return RecipeViewModel(recipes: recipes)
    }
}
