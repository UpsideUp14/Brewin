//
//  Stopwatch.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 13.04.23.
//

import SwiftUI
import os

struct StopwatchView: View {
    @ObservedObject var stopwatch: Stopwatch
    var logger = Logger(subsystem: "Stopwatch Subsystem", category: "Stopwatch")
    var body: some View {
        VStack {
            // Displays time in the format of: minutes:seconds:millisecods
            HStack(alignment: .bottom, spacing: 2) {
                Text(String(format: "%02d:%02d", stopwatch.minutes, stopwatch.seconds))
                    .font(.system(size: 60))
                Spacer()
                Text(String(format: "%02d", stopwatch.milliseconds))
                    .font(.system(size: 30))
                    .opacity(0.5)
            }.frame(width: 210, height: 60)
            HStack {
                // Stopwatch controls (start, pause, and stop (reset))
                Button(action: {
                    stopwatch.isRunning.toggle()
                }, label: {
                    Image(systemName: stopwatch.isRunning ? "pause.circle" : "play.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                })
                Button(action: {
                    self.reset()
                }, label: {
                    Image(systemName: "stop.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                })
            }
        }
        .padding()
        .onReceive(stopwatch.timer) { _ in
            // calculates respective time for each scale after each update
            if stopwatch.isRunning {
                stopwatch.elapsed += 0.01
                stopwatch.milliseconds = Int(stopwatch.elapsed * 100.0) % 100
                stopwatch.seconds = Int(stopwatch.elapsed) % 60
                stopwatch.minutes = Int(stopwatch.elapsed) / 60 % 60
            }
        }
    }
    func reset() {
        stopwatch.isRunning = false
        stopwatch.elapsed = TimeInterval.zero
        stopwatch.milliseconds = 0
        stopwatch.seconds = 0
        stopwatch.minutes = 0
        logger.log("Stopping stopwatch")
    }
}
