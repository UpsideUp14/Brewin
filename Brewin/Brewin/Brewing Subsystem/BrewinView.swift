//
//  BrewinView.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 15.04.23.
//

import SwiftUI

struct BrewinView: View {
    @ObservedObject var recipeViewModel: RecipeViewModel
    @ObservedObject var beansViewModel: BeansViewModel
    @ObservedObject var logViewModel: LogViewModel
    @State var pickedRecipe: Recipe.ID = nil
    @State var pickedBean: Bean.ID = nil
    @State var pickedGrindSize: Double = 0.0
    @State var pickedTemp: Int = 0
    @State var allPicked: Bool = false
    @State var isShowingLogs: Bool = false
    @State var isSavingLog: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                // Only show image if recipe and beans are not picked
                if !allPicked {
                    CoffeeImage()
                }
                HStack {
                    ZStack {
                        // ZStack for Recipe Picker
                        Background()
                            .frame(width: 170, height: 80)
                        VStack {
                            Text("Select Recipe:")
                                .font(.headline)
                            Picker("Recipe", selection: $pickedRecipe) {
                                ForEach(recipeViewModel.recipes) { recipe in
                                    Text(recipe.name).tag(recipe.id)
                                }
                            }
                            .onChange(of: pickedRecipe) { _ in
                                checkSelection()
                            }
                            .frame(height: 10)
                        }
                    }
                    Spacer()
                    // ZStack for Beans Picker
                    ZStack {
                        Background()
                            .frame(width: 170, height: 80)
                        VStack {
                            Text("Select Beans:")
                                .font(.headline)
                            Picker("Beans", selection: $pickedBean) {
                                ForEach(beansViewModel.beans) { bean in
                                    Text(bean.name).tag(bean.id)
                                }
                            }
                            .onChange(of: pickedBean) { _ in
                                checkSelection()
                            }
                            .frame(height: 10)
                        }
                    }
                }
                .frame(width: 280)
                // Only show Grind size picker, Temp picker, instructions
                // and stopwatch once valid recipe and beans are picked
                if allPicked {
                    HStack {
                        ZStack {
                            Background()
                                .frame(width: 170, height: 80)
                            VStack {
                                Text("Grind Size:")
                                    .font(.headline)
                                    .frame(height: 10)
                                // Grind size only between 0.0 to 9.0 according
                                // to a 1zpresso grinder
                                Picker("Grind size", selection: $pickedGrindSize) {
                                    ForEach(0..<91) { index in
                                        let value = Double(index) / 10
                                        Text(String(format: "%.1f", value)).tag(value)
                                    }
                                }
                                .pickerStyle(WheelPickerStyle())
                                .frame(height: 40)
                            }
                        }
                        Spacer()
                        ZStack {
                            Background()
                                .frame(width: 170, height: 80)
                            VStack {
                                // Water only go as low as 60, as you dont usually
                                // brew (hot) coffee at any lower temp
                                // Max temp at 100 because of physics
                                Text("Water Temprature:")
                                    .font(.headline)
                                    .frame(height: 10)
                                Picker("Temp", selection: $pickedTemp) {
                                    ForEach(60..<101, id: \.self) { temp in
                                        Text("\(temp)").tag(temp)
                                    }
                                }
                                .pickerStyle(WheelPickerStyle())
                                .frame(height: 40)
                            }
                        }
                    }
                    .frame(width: 280)
                    // List of instructions with the time is shown here for a given recipe
                    Text("Instructions:")
                        .font(.headline)
                    ForEach(recipeViewModel.recipes, id:\.self) { recipe in
                        if(recipe.id == pickedRecipe) {
                            List(recipe.instructions, id: \.self) {
                                Text("\($0.message)  \(Int($0.time))s")
                            }
                        }
                    }
                    .frame(height: 300)
                    ZStack {
                        Background()
                            .frame(width: 350, height: 140)
                        StopwatchView(stopwatch: Stopwatch())
                    }
                    .offset(y: -60)
                }
            }
            .toolbar {
                // open a view to all logs
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {isShowingLogs.toggle()}) {
                        Image(systemName: "list.dash")
                    }
                    .sheet(isPresented: $isShowingLogs, content: {
                        LogOverview(logViewModel: logViewModel, isSavingLog: $isShowingLogs)
                    })
                }
                // Log current brew
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {isSavingLog.toggle()}) {
                        Text("Save")
                    }
                    .sheet(isPresented: $isSavingLog, content: {
                        SaveLogView(logViewModel: logViewModel, recipeViewModel: recipeViewModel, beansViewModel: beansViewModel,
                                    isSavingLog: $isSavingLog, recipeId: $pickedRecipe, beanId: $pickedBean, grindSize: $pickedGrindSize, temp: $pickedTemp)
                    })
                }
            }
        }
    }
    // check if both recipe and beans have been selected
    private func checkSelection() {
        if (pickedRecipe != nil && pickedBean != nil) {
            withAnimation {
                self.allPicked = true
            }
        }
    }
}

struct Background: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Color(colorScheme == .light ? .systemBackground : .tertiarySystemBackground))
            .shadow(radius: 2)
    }
}

struct BrewinView_Previews: PreviewProvider {
    static var previews: some View {
        BrewinView(recipeViewModel: RecipeViewModel.mockRecipeViewModel(), beansViewModel: BeansViewModel.mockBeansViewModel(), logViewModel: LogViewModel.mockLogViewModel())
    }
}
