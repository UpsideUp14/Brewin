//
//  LogViewModel.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 15.04.23.
//

import Foundation

class LogViewModel: ObservableObject {
    @Published var logs: [Log]
    init (logs: [Log]) {
        self.logs = logs
    }
    static func mockLogViewModel () -> LogViewModel {
        let log1 = Log(id: UUID(),
                       recipeName: "V60 Recipe",
                       beanName: "Yirgacheffe",
                       grindSize: 7.0,
                       temp: 95,
                       description: "Terrible Coffee")
        let log2 = Log(id: UUID(),
                       recipeName: "V60 Recipe",
                       beanName: "Toba",
                       grindSize: 6.0,
                       temp: 88,
                       description: "Yikes")
        let logs = [log1, log2]
        return LogViewModel(logs: logs)
    }
}
