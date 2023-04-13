//
//  BeansOverview.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 13.04.23.
//

import Foundation

class BeansViewModel: ObservableObject {
    @Published var beans: [Bean]
    
    init(beans: [Bean]) {
        self.beans = beans
    }
    
}
