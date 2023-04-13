//
//  ContentView.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 12.04.23.
//

import SwiftUI

struct ContentView: View {
    //@ObservedObject var recipeViewModel: RecipeViewModel
    //@ObservedObject var beansViewModel: BeansViewModel
    
    var body: some View {
        VStack {
            HStack {
                /*
                Picker("Recipe", selection: $recipeViewModel.recipes[0]) {
                    
                }
                Picker("Beans", selection: $beansViewModel.beans[0]) {
                    
                }
                 */
                Text("Recipe").
                Text("Beans")
            }
            Text("Instructions")
            Text("Stopwatch")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
