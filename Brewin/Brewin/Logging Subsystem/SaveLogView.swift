//
//  SaveLogView.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 15.04.23.
//

import SwiftUI

struct SaveLogView: View {
    @ObservedObject var logViewModel: LogViewModel
    @ObservedObject var recipeViewModel: RecipeViewModel
    @ObservedObject var beansViewModel: BeansViewModel
    @State public var description: String = ""
    @Binding public var isSavingLog: Bool
    @Binding var recipeId: Recipe.ID
    @Binding var beanId: Bean.ID
    @Binding var grindSize: Double
    @Binding var temp: Int
    
    var body: some View {
        let recipeName = getRecipeName(array: recipeViewModel.recipes, id: recipeId!)
        let beanName = getBeanName(array: beansViewModel.beans, id: beanId!)
        let log = Log(id: UUID(), recipeId: recipeId, beanId: beanId, recipeName: recipeName, beanName: beanName, grindSize: grindSize, temp: temp, description: description )
        NavigationStack {
            Form {
                Section("Description") {
                    TextField("Brew log description", text: $description)
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        logViewModel.logs.append(log)
                        isSavingLog.toggle()}) {
                        Text("Save")
                    }
                }
            }
        }
    }
    
    private func getRecipeName(array: [Recipe], id: UUID) -> String {
        if let recipe = array.first(where: {$0.id == id}) {
            return recipe.name
        }
        return ""
    }
    private func getBeanName(array: [Bean], id: UUID) -> String {
        if let bean = array.first(where: {$0.id == id}) {
            return bean.name
        }
        return ""
    }
}

struct SaveLogView_Previews: PreviewProvider {
    static var previews: some View {
        SaveLogView(logViewModel: LogViewModel.mockLogViewModel(), recipeViewModel: RecipeViewModel.mockRecipeViewModel(),
                    beansViewModel: BeansViewModel.mockBeansViewModel(), isSavingLog: .constant(false), recipeId: .constant(nil), beanId: .constant(nil), grindSize: .constant(0.0), temp: .constant(0))
    }
}
