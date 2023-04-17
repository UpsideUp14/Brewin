//
//  Log.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 15.04.23.
//

import Foundation

class Log: ObservableObject {
    @Published var id: UUID?
    @Published var recipeName: String
    @Published var beanName: String
    @Published var grindSize: Double
    @Published var temp: Int
    @Published var description: String
    init (id: UUID?,
          recipeName: String,
          beanName: String,
          grindSize: Double,
          temp: Int,
          description: String) {
        self.id = id
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
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
