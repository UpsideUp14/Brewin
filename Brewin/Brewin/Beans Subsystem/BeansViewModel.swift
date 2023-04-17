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
    public static func mockBeansViewModel() -> BeansViewModel {
        let ethiopianBeanId = UUID()
        let ethiopianBean = Bean(id: ethiopianBeanId, name: "Yirgacheffe", origin: "Ethiopia", process: "Washed", height: 2200, notes: "-Blueberry\n-Chocolate")
        let sumatranBeanId = UUID()
        let sumatranBean = Bean(id: sumatranBeanId, name: "Toba", origin: "Aceh", process: "Washed", height: 1500, notes: "-Toffee\n-Chocolate")
        let mrBean = Bean(id: UUID(), name: "Mr. Bean", origin: "Consett, UK", process: "Comedian", height: 181, notes: "-Teddy\n-Bear")
        
        let beans = [ethiopianBean, sumatranBean, mrBean]
        return BeansViewModel(beans: beans)
    }
}
