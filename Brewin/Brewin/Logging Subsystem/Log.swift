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
    @Published public var grindSize: Int
    @Published public var temp: Int
    
    public init (id: UUID?, recipeId: Recipe.ID, beanId: Bean.ID, recipeName: String, beanName: String, grindSize: Int, temp: Int) {
        self.id = id
        self.recipeId = recipeId
        self.beanId = beanId
        self.recipeName = recipeName
        self.beanName = beanName
        self.grindSize = grindSize
        self.temp = temp
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
