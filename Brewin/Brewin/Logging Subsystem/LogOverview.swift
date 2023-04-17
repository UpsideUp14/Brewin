//
//  LogOverview.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 15.04.23.
//

import SwiftUI

struct LogOverview: View {
    @ObservedObject var logViewModel: LogViewModel
    @Binding public var isSavingLog: Bool
    var body: some View {
        NavigationStack {
            List {
                ForEach(logViewModel.logs, id: \.self) { log in
                    let grindSize = String(format: "%.1f", log.grindSize)
                    Text("""
                         Recipe: \(log.recipeName)
                         Beans: \(log.beanName)
                         Grindsize: \(grindSize)
                         Temperature: \(log.temp)
                         Descriptions: \(log.description)
                         """)
                }
            }
            .navigationTitle("Logs")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {isSavingLog.toggle()}, label: {
                        Text("Close")
                        })
                }
            }
        }
    }
}

struct LogOverview_Previews: PreviewProvider {
    static var previews: some View {
        LogOverview(logViewModel: LogViewModel.mockLogViewModel(), isSavingLog: .constant(false))
    }
}
