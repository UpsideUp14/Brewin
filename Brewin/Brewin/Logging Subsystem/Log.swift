//
//  Log.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 15.04.23.
//

import Foundation

class Log: ObservableObject {
    @Published public var id: UUID?
    @Published public var recipeId: Recipe.ID
    @Published public var beanId: Bean.ID
    @Published public var recipeName: String
    @Published public var beanName: String
    @Published public var grindSize: Double
    @Published public var temp: Int
    @Published public var description: String
    
    public init (id: UUID?, recipeId: Recipe.ID, beanId: Bean.ID, recipeName: String, beanName: String, grindSize: Double, temp: Int, description: String) {
        self.id = id
        self.recipeId = recipeId
        self.beanId = beanId
        self.recipeName = recipeName
        self.beanName = beanName
        self.grindSize = grindSize
        self.temp = temp
        self.description = description
    }
}

extension Log: Identifiable { }

extension Log: Hashable {
    public static func == (lhs: Log, rhs: Log) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

}
