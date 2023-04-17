//
//  Bean.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 13.04.23.
//

import Foundation

class Bean: ObservableObject {
    @Published var id: UUID?
    @Published var name: String
    @Published var origin: String
    @Published var process: String
    @Published var height: Int
    @Published var notes: String
    init(id: UUID?, name: String, origin: String, process: String, height: Int, notes: String) {
        self.id = id
        self.name = name
        self.origin = origin
        self.process = process
        self.height = height
        self.notes = notes
    }
    static func emptyBean () -> Bean {
        Bean(id: UUID(), name: "", origin: "", process: "", height: 0, notes: "")
    }
}
extension Bean: Identifiable { }

extension Bean: Hashable {
    public static func == (lhs: Bean, rhs: Bean) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
}

extension Bean: Comparable {
    public static func < (lhs: Bean, rhs: Bean) -> Bool {
        lhs.id == rhs.id &&
        lhs.name < rhs.name
    }
}
