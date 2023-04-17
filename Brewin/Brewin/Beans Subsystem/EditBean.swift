//
//  EditBean.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 15.04.23.
//

import SwiftUI

// Edit or add Beans
// TODO: implement saving system
struct EditBean: View {
    @ObservedObject var beanViewModel: BeansViewModel
    @State var id: UUID?
    @ObservedObject var bean: Bean
    
    var body: some View {
        /*
        if let index = recipeViewModel.recipes.firstIndex(where: {$0.id == id}) {
            recipe = recipeViewModel.recipes[index]
        } else {
           // item could not be found
        }
         */
        NavigationStack {
            Form {
                Section(header: Text("Name")) {
                    TextField("Bean Name", text: $bean.name)
                }
                Section(header: Text("Origin")) {
                    TextField("Bean Origin", text: $bean.origin)
                }
                Section(header: Text("Process")) {
                    TextField("Bean Processing", text: $bean.process)
                }
                Section(header: Text("Height")) {
                    TextField("Coffee plantation height", value: $bean.height, format: .number)
                }
                Section(header: Text("Notes")) {
                    TextField("Tasting notes", text: $bean.notes, axis: .vertical)
                }
                
            }
        }
                
    }
}

struct EditBean_Previews: PreviewProvider {
    static var previews: some View {
        EditBean(beanViewModel: BeansViewModel.mockBeansViewModel(), bean: Bean.emptyBean())
    }
}
