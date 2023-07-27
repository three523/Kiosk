//
//  burger.swift
//  Kiosk
//
//  Created by t2023-m0062 on 2023/07/24.
//

import Foundation

class Burger { //burger클래스(붕어빵 틀) 추상화
    //MARK: - Properties
    var name: String
    var price: String
    var description: String // (이게 프로퍼티 멤버변수)
    
    init(name: String, price: String, description: String) { //생성자(init)가 매개변수(num)를 통해 값을 받으면
        self.name = name //여기서 초기화해준다.
        self.price = price
        self.description = description
    } //생성자가 끝나기 전에 프로퍼티(멤버변수)값을 초기화 해줘야 한다.
    
    func display(num: String) {
        print("\(num)\(name) + | \(price) | + \(description)")
    }
    
    
    
    
    
    //Burger클래스의 인스턴스
    //    var a : Burger = Burger(num: "1", name: "버거", price: "1000", description: "쉑쉑")
    //    var b : Burger = Burger(num: "2", name: "버거버거", price: "2000", description: "맥날")
    
    
    
    
    
}