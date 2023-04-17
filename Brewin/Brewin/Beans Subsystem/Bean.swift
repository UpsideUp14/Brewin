//
//  Bean.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 13.04.23.
//

import Foundation

class Bean: ObservableObject {
    @Published public var id: UUID?
    @Published public var name: String
    @Published public var origin: String
    @Published public var process: String
    @Published public var height: Int
    @Published public var notes: String
    public init(id: UUID?, name: String, origin: String, process: String, height: Int, notes: String) {
        self.id = id
        self.name = name
        self.origin = origin
        self.process = process
        self.height = height
        self.notes = notes
    }
    public static func emptyBean () -> Bean {
        Bean(id: UUID(), name: "", origin: "", process: "", height: 0, notes: "")
    }
}
extension Bean: Identifiable { }

extension Bean: Hashable {
    public static func == (lhs: Bean, rhs: Bean) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name
    }
    func hash(into hasher: inout Hasher) {
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
