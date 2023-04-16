//
//  SaveLogView.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 15.04.23.
//

import SwiftUI

struct SaveLogView: View {
    @ObservedObject var logViewModel: LogViewModel
    @State public var description: String = ""
    @Binding public var isSavingLog: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Description") {
                    TextField("Brew log description", text: $description)
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {isSavingLog.toggle()}) {
                        Text("Save")
                    }
                }
            }
        }
       

    }
}

struct SaveLogView_Previews: PreviewProvider {
    static var previews: some View {
        SaveLogView(logViewModel: LogViewModel.mockLogViewModel(), isSavingLog: .constant(false))
    }
}
