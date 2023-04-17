//
//  Stopwatch.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 14.04.23.
//

import Foundation

// keeps track of time date
class Stopwatch: ObservableObject {
    @Published var isRunning = false
    @Published var elapsed = TimeInterval.zero
    @Published var milliseconds = 0
    @Published var seconds = 0
    @Published var minutes = 0
    @Published var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
}
