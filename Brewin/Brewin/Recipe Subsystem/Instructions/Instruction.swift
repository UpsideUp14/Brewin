//
//  Instruction.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 13.04.23.
//

import Foundation

public class Instruction: ObservableObject {
    @Published public var id: UUID?
    @Published public var message: String
    @Published public var time: TimeInterval
    public init(id: UUID? = nil, message: String, time: TimeInterval) {
        self.id = id
        self.message = message
        self.time = time
    }
    public static func emptyInstruction () -> Instruction {
        Instruction(id: nil, message: "", time: 0)
    }
}

extension Instruction: Identifiable { }

extension Instruction: Hashable {
    public static func == (lhs: Instruction, rhs: Instruction) -> Bool {
        lhs.id == rhs.id &&
        lhs.message == rhs.message &&
        lhs.time == rhs.time
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(message)
        hasher.combine(time)
    }
}

extension Instruction: Comparable {
    public static func < (lhs: Instruction, rhs: Instruction) -> Bool {
        lhs.id == rhs.id &&
        lhs.time < rhs.time
    }
}
