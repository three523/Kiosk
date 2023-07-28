//
//  Drink.swift
//  Kiosk
//
//  Created by 김도현 on 2023/07/28.
//

import Foundation

class Drinks: Food {
    var takeOut: Bool = true
    
    init(name: String, price: Int, description: String, takeOut: Bool) {
        super.init(name: name, price: price, description: description)
    }
}
