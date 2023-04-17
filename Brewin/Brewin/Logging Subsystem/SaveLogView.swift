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
    @ObservedObject var brewinViewModel: BrewinViewModel
    var body: some View {
        let recipeName = getRecipeName(array: recipeViewModel.recipes, id: brewinViewModel.pickedRecipe ?? UUID())
        let beanName = getBeanName(array: beansViewModel.beans, id: brewinViewModel.pickedBean ?? UUID())
        let log = Log(id: UUID(),
                      recipeId: brewinViewModel.pickedRecipe,
                      beanId: brewinViewModel.pickedBean,
                      recipeName: recipeName,
                      beanName: beanName,
                      grindSize: brewinViewModel.pickedGrindSize,
                      temp: brewinViewModel.pickedTemp,
                      description: description)
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
                        brewinViewModel.isSavingLog.toggle()}, label: {
                        Text("Save")
                    })
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
        SaveLogView(
            logViewModel: LogViewModel.mockLogViewModel(),
            recipeViewModel: RecipeViewModel.mockRecipeViewModel(),
            beansViewModel: BeansViewModel.mockBeansViewModel(), brewinViewModel: BrewinViewModel())
    }
}
