//
//  Recipe.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 13.04.23.
//

import Foundation
import SwiftUI

class Recipe: ObservableObject {
    @Published public var id: UUID?
    @Published public var name: String
    @Published public var brewingMethod: BrewingMethod
    @Published public var instructions: [Instruction]
    
    public init(id: UUID?, name: String, method: BrewingMethod, instructions: [Instruction]) {
        self.id = id
        self.name = name
        self.brewingMethod = method
        self.instructions = instructions
    }
    
    public static func emptyRecipe () -> Recipe {
        return Recipe(id: nil, name: "", method: .empty, instructions: [])
    }
}

enum BrewingMethod: CaseIterable, Identifiable, CustomStringConvertible {
    case v60
    case espresso
    case chemex
    case aeropress
    case frenchpress
    case kalitawave
    case empty
    
    var id: Self { self }
    
    var description: String {
        switch self {
        case .v60:
            return "V60"
        case .espresso:
            return "Espresso"
        case .chemex:
            return "Chemex"
        case .aeropress:
            return "Aeropress"
        case .frenchpress:
            return "Frenchpress"
        case .kalitawave:
            return "Kalita Wave"
        case .empty:
            return ""
        }
    }
}

extension Recipe: Identifiable { }

extension Recipe: Hashable {
    public static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }

}

extension Recipe: Comparable {
    public static func < (lhs: Recipe, rhs: Recipe) -> Bool {
        lhs.id == rhs.id &&
        lhs.name < rhs.name
    }
}
