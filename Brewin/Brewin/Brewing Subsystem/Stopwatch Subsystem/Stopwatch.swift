//
//  Stopwatch.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 14.04.23.
//

import Foundation

// keeps track of time date
class Stopwatch: ObservableObject {
    @Published public var isRunning = false
    @Published public var elapsed = TimeInterval.zero
    @Published public var milliseconds = 0
    @Published public var seconds = 0
    @Published public var minutes = 0
    @Published public var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
}
