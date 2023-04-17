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
        let chemexInstructionTime0: TimeInterval = 0
        let chemexRecipeInstruction0 = Instruction(id: UUID(), message: "Put paper filter into Chemex", time: chemexInstructionTime0)
        let chemexInstructionTime1: TimeInterval = 0
        let chemexRecipeInstruction1 = Instruction(id: UUID(), message: "Put 15g of Coffee into filter", time: chemexInstructionTime1)
        let chemexInstructionTime2: TimeInterval = 60
        let chemexRecipeInstruction2 = Instruction(id: UUID(), message: "Pour 150ml of water into kettle", time: chemexInstructionTime2)
        
        
        let v60InstructionTime: TimeInterval = 90
        let v60RecipeInstruction = Instruction(id: UUID(), message: "Put filter into V60", time: v60InstructionTime)
        
        let chemexRecipe = Recipe(id: UUID(), name: "Chemex Recipe", method: .chemex, instructions: [chemexRecipeInstruction0, chemexRecipeInstruction1, chemexRecipeInstruction2])
        let v60Recipe = Recipe(id: UUID(), name: "V60 Recipe", method: .v60, instructions: [v60RecipeInstruction])
        
        let recipes = [chemexRecipe, v60Recipe]
        return RecipeViewModel(recipes: recipes)
    }
}
