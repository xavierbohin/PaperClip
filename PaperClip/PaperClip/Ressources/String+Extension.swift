//
//  String+Extension.swift
//  PaperClip
//
//  Created by xavier bohin on 12/12/2021.
//

extension String {
    
    init?(from price: Double) {
        let formattedPrice = String(price)+" €"
        self.init(formattedPrice)
    }
    
    init(from categoryId: Int, with dictionary: Dictionary<Int, String>) {
        let formattedCategory = dictionary[categoryId] ?? "Toutes catégories"
        self.init(formattedCategory)
    }

}
