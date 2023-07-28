//
//  Bear.swift
//  Kiosk
//
//  Created by 김도현 on 2023/07/24.
//

import Foundation
class Beer {
    var name: String
    var descripton: String
    var price: Int
    
    init(name: String, descripton: String, price: Int) {
        self.name = name
        self.descripton = descripton
        self.price = price
    }
    
    func displayInfo(index: Int) {
        print("\(index+1). \(name) | W\(price) | \(descripton)")
    }
}
