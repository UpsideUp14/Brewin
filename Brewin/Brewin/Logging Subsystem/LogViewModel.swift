//
//  LogViewModel.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 15.04.23.
//

import Foundation

class LogViewModel: ObservableObject {
    @Published public var logs: [Log]
    public init (logs: [Log]) {
        self.logs = logs
    }
    public static func mockLogViewModel () -> LogViewModel {
        let recipe1 = UUID()
        let bean1 = UUID()
        let bean2 = UUID()
        let log1 = Log(id: UUID(),
                       recipeId: recipe1,
                       beanId: bean1,
                       recipeName: "V60 Recipe",
                       beanName: "Yirgacheffe",
                       grindSize: 7.0,
                       temp: 95,
                       description: "Terrible Coffee")
        let log2 = Log(id: UUID(),
                       recipeId: recipe1,
                       beanId: bean2,
                       recipeName: "V60 Recipe",
                       beanName: "Toba",
                       grindSize: 6.0,
                       temp: 88,
                       description: "Yikes")
        let logs = [log1, log2]
        return LogViewModel(logs: logs)
    }
}
