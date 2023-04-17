//
//  BrewinViewModel.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 17.04.23.
//

import Foundation

class BrewinViewModel: ObservableObject {
    @Published var pickedRecipe: Recipe.ID = nil
    @Published var pickedBean: Bean.ID = nil
    @Published var pickedGrindSize: Double = 0.0
    @Published var pickedTemp: Int = 0
    @Published var allPicked: Bool = false
    @Published var isShowingLogs: Bool = false
    @Published var isSavingLog: Bool = false
}
