//
//  Drink.swift
//  Kiosk
//
//  Created by 김도현 on 2023/07/28.
//

import Foundation

class Drinks: Food {
    var takeOut: Bool {
        didSet {
            if takeOut { price += 0.3 }
        }
    }
    
    init(name: String, price: Double, description: String, takeOut: Bool) {
        self.takeOut = takeOut
        super.init(name: name, price: price, description: description)
    }
    
    override func create() -> Food {
        return Drinks(name: name, price: price, description: description, takeOut: takeOut)
    }
}

