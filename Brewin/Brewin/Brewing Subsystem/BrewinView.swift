//
//  BrewinView.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 15.04.23.
//

import SwiftUI
import os

struct BrewinView: View {
    @ObservedObject var recipeViewModel: RecipeViewModel
    @ObservedObject var beansViewModel: BeansViewModel
    @ObservedObject var logViewModel: LogViewModel
    @ObservedObject var brewinViewModel: BrewinViewModel
    var body: some View {
        NavigationStack {
            VStack {
                // Only show image if recipe and beans are not picked
                if !brewinViewModel.allPicked {
                    CoffeeImage()
                }
                HStack {
                    MainPickers(brewinViewModel: brewinViewModel,
                                recipeViewModel: recipeViewModel,
                                beansViewModel: beansViewModel)
                }
                .frame(width: 280)
                // Only show Grind size picker, Temp picker, instructions
                // and stopwatch once valid recipe and beans are picked
                if brewinViewModel.allPicked {
                    RestElements(brewinViewModel: brewinViewModel, recipeViewModel: recipeViewModel)
                    .offset(y: -60)
                }
            }
            .toolbar {
                // open a view to all logs
                ToolbarItem(placement: .cancellationAction) {
                    ViewLogs(brewinViewModel: brewinViewModel, logViewModel: logViewModel)
                }
                // Log current brew
                ToolbarItem(placement: .primaryAction) {
                    SaveLog(brewinViewModel: brewinViewModel,
                            recipeViewModel: recipeViewModel,
                            beansViewModel: beansViewModel,
                            logViewModel: logViewModel)
                }
            }
        }
    }
}

// check if both recipe and beans have been selected
private func checkSelection(brewinViewModel: BrewinViewModel, logger: Logger) {
    if brewinViewModel.pickedRecipe != nil && brewinViewModel.pickedBean != nil {
        logger.log("Recipes and Beans are picked. showing rest of UI")
        withAnimation {
            brewinViewModel.allPicked = true
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

//Shows the main picker on the home page
struct MainPickers: View {
    @ObservedObject var brewinViewModel: BrewinViewModel
    @ObservedObject var recipeViewModel: RecipeViewModel
    @ObservedObject var beansViewModel: BeansViewModel
    var body: some View {
        RecipePicker(brewinViewModel: brewinViewModel, recipeViewModel: recipeViewModel)
        Spacer()
        // ZStack for Beans Picker
        BeanPicker(brewinViewModel: brewinViewModel, beansViewModel: beansViewModel)
    }
}
// Shows the rest of the elements once recipe and beans are picked
struct RestElements: View {
    @ObservedObject var brewinViewModel: BrewinViewModel
    @ObservedObject var recipeViewModel: RecipeViewModel
    var body: some View {
        HStack {
            GrindSizePicker(brewinViewModel: brewinViewModel)
            Spacer()
            TempPicker(brewinViewModel: brewinViewModel)
        }
        .frame(width: 280)
        InstructionViewer(brewinViewModel: brewinViewModel, recipeViewModel: recipeViewModel)
        .frame(height: 300)
        ZStack {
            Background()
                .frame(width: 350, height: 140)
            StopwatchView(stopwatch: Stopwatch())
        }
    }
}
struct RecipePicker: View {
    @ObservedObject var brewinViewModel: BrewinViewModel
    @ObservedObject var recipeViewModel: RecipeViewModel
    var logger = Logger(subsystem: "brewing Subsystem", category: "BrewinView")
    var body: some View {
        ZStack {
            // ZStack for Recipe Picker
            Background()
                .frame(width: 170, height: 80)
            VStack {
                Text("Select Recipe:")
                    .font(.headline)
                Picker("Recipe", selection: $brewinViewModel.pickedRecipe) {
                    ForEach(recipeViewModel.recipes) { recipe in
                        Text(recipe.name).tag(recipe.id)
                    }
                }
                .onChange(of: brewinViewModel.pickedRecipe) { _ in
                    checkSelection(brewinViewModel: brewinViewModel, logger: logger)
                }
                .frame(height: 10)
            }
        }
    }
}

struct BeanPicker: View {
    @ObservedObject var brewinViewModel: BrewinViewModel
    @ObservedObject var beansViewModel: BeansViewModel
    var logger = Logger(subsystem: "brewing Subsystem", category: "BrewinView")
    var body: some View {
        ZStack {
            Background()
                .frame(width: 170, height: 80)
            VStack {
                Text("Select Beans:")
                    .font(.headline)
                Picker("Beans", selection: $brewinViewModel.pickedBean) {
                    ForEach(beansViewModel.beans) { bean in
                        Text(bean.name).tag(bean.id)
                    }
                }
                .onChange(of: brewinViewModel.pickedBean) { _ in
                    checkSelection(brewinViewModel: brewinViewModel, logger: logger)
                }
                .frame(height: 10)
            }
        }
    }
}

struct GrindSizePicker: View {
    @ObservedObject var brewinViewModel: BrewinViewModel
    var body: some View {
        ZStack {
            Background()
                .frame(width: 170, height: 80)
            VStack {
                Text("Grind Size:")
                    .font(.headline)
                    .frame(height: 10)
                // Grind size only between 0.0 to 9.0 according
                // to a 1zpresso grinder
                Picker("Grind size", selection: $brewinViewModel.pickedGrindSize) {
                    ForEach(0..<91) { index in
                        let value = Double(index) / 10
                        Text(String(format: "%.1f", value)).tag(value)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(height: 40)
            }
        }
    }
}

struct TempPicker: View {
    @ObservedObject var brewinViewModel: BrewinViewModel
    var body: some View {
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
                Picker("Temp", selection: $brewinViewModel.pickedTemp) {
                    ForEach(60..<101, id: \.self) { temp in
                        Text("\(temp)").tag(temp)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(height: 40)
            }
        }
    }
}
struct InstructionViewer: View {
    @ObservedObject var brewinViewModel: BrewinViewModel
    @ObservedObject var recipeViewModel: RecipeViewModel
    var body: some View {
        // List of instructions with the time is shown here for a given recipe
        Text("Instructions:")
            .font(.headline)
        ForEach(recipeViewModel.recipes, id: \.self) { recipe in
            if recipe.id == brewinViewModel.pickedRecipe {
                List(recipe.instructions, id: \.self) {
                    Text("\($0.message)  \(Int($0.time))s")
                }
            }
        }
    }
}
struct ViewLogs: View {
    @ObservedObject var brewinViewModel: BrewinViewModel
    @ObservedObject var logViewModel: LogViewModel
    var body: some View {
        Button(action: { brewinViewModel.isShowingLogs.toggle() }, label: {
            Image(systemName: "list.dash")
            })
        .sheet(isPresented: $brewinViewModel.isShowingLogs, content: {
            LogOverview(logViewModel: logViewModel, isSavingLog: $brewinViewModel.isShowingLogs)
        })
    }
}
struct SaveLog: View {
    @ObservedObject var brewinViewModel: BrewinViewModel
    @ObservedObject var recipeViewModel: RecipeViewModel
    @ObservedObject var beansViewModel: BeansViewModel
    @ObservedObject var logViewModel: LogViewModel
    var body: some View {
        Button(action: { brewinViewModel.isSavingLog.toggle() }, label: {
            Text("Save")
            })
        .sheet(isPresented: $brewinViewModel.isSavingLog, content: {
            SaveLogView(
                logViewModel: logViewModel,
                recipeViewModel: recipeViewModel,
                beansViewModel: beansViewModel,
                brewinViewModel: brewinViewModel)
        })
    }
}
struct BrewinView_Previews: PreviewProvider {
    static var previews: some View {
        BrewinView(
            recipeViewModel: RecipeViewModel.mockRecipeViewModel(),
            beansViewModel:BeansViewModel.mockBeansViewModel(),
            logViewModel: LogViewModel.mockLogViewModel(),
            brewinViewModel: BrewinViewModel())
    }
}
