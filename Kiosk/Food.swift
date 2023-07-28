//
//  Food.swift
//  Kiosk
//
//  Created by 김도현 on 2023/07/28.
//

import Foundation

class Food {
    var name: String
    var price: Int
    var description: String
    
    init(name: String, price: Int, description: String) {
        self.name = name
        self.price = price
        self.description = description
    }
    
    func displayInfo(at index: Int) {
        print("\(index + 1). \(name) | W \(price) | \(description)")
    }
}
