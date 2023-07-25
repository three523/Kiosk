//
//  burger.swift
//  Kiosk
//
//  Created by t2023-m0062 on 2023/07/24.
//

import Foundation

class Burger { //burger클래스 추상화
    var num: String
    var name: String
    var price: String
    var description: String
    
    init(num:String, name: String, price: String, description: String) {
        self.num = num
        self.name = name
        self.price = price
        self.description = description
    }
    
    func display() {
        print("\(num). \(name) + | \(price) | + \(description)")
    }
}


//var 리스트변수: [클래스타입] = []
let burgers: [Burger] = [
    Burger(num: "1", name: "ShackBurger", price: "W 6.9", description: "토마토, 양상추, 쉑소스가 토핑된 치즈버거"),
    Burger(num: "2", name: "SmokeShack" , price: "W 8.9", description: "베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거"),
    Burger(num: "3", name: "Shroom Burger", price: "W 9.4", description: "몬스터 치즈와 체다 치즈로 속을 채운 베지테리안버거"),
    Burger(num: "4", name: "Cheeseburger", price: "W 6.9", description: "포테이토 번과 비프패티, 치즈가 토핑된 치즈버거"),
    Burger(num: "5", name: "Hamburger", price: "W 5.4", description: "비프패티를 기반으로 야채가 들어간 기본버거")
]

