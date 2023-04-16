//
//  BeansView.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 14.04.23.
//

import SwiftUI

struct BeansOverview: View {
    @State private var isShowingSheet = false
    @ObservedObject var beansViewModel: BeansViewModel
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(beansViewModel.beans, id: \.self) { bean in
                    NavigationLink(bean.name, destination: EditBean(beanViewModel: beansViewModel, bean: bean)
                    )
                }
            }
                .navigationTitle("Beans")
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button(action: {isShowingSheet.toggle()}) {
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $isShowingSheet, content: {
                            EditBean(beanViewModel: beansViewModel, bean: Bean.emptyBean())
                        })
                    }
                }
        }
    }
}

struct BeansView_Previews: PreviewProvider {
    static var previews: some View {
        BeansOverview(beansViewModel: BeansViewModel.mockBeansViewModel())
    }
}
