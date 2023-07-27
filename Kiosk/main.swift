//
//  main.swift
//  Kiosk
//
//  Created by 김도현 on 2023/07/24.
//


import Foundation

let mainMenu = """
아래 메뉴판을 보시고 메뉴를 골라 번호를 입력해주세요.

[ SHAKESHACK MENU ]
1. Burgers         | 앵거스 비프 통살을 다져만든 버거
2. Frozen Custard  | 매장에서 신선하게 만드는 아이스크림
3. Drinks          | 매장에서 직접 만드는 음료
4. Beer            | 뉴욕 브루클린 브루어리에서 양조한 맥주
0. 종료            | 프로그램 종료
"""

let burgersMenu = """
주문할 메뉴의 번호를 입력해주세요.

[ Burgers MENU ]
1. ShackBurger   | W 6.9 | 토마토, 양상추, 쉑소스가 토핑된 치즈버거
2. SmokeShack    | W 8.9 | 베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거
3. Shroom Burger | W 9.4 | 몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거
4. Cheeseburger  | W 6.9 | 포테이토 번과 비프패티, 치즈가 토핑된 치즈버거
5. Hamburger     | W 5.4 | 비프패티를 기반으로 야채가 들어간 기본버거
0. 뒤로가기      | 뒤로가기
"""

class ItemList {
    var name: String
    var price: Double
    var description: String
    
    init(name: String, price: Double, description: String) {
        self.name = name
        self.price = price
        self.description = description
    }
    
    func displayInfo(at index: Int) {
        print("\(index + 1). \(name) | W\(price) | \(description)")
    }
}

class Drinks: ItemList {
    //매장컵 이용할건지 Bool 타입으로 묻기
    var forHere: Bool = true
    
    init(name: String, price: Double, description: String, forHere: Bool) {
        super.init(name: name, price: price, description: description)
    }
}

let drinksMenu: [Drinks] = [
    Drinks(name: "Lemonade", price: 3.9, description: "매장에서 직접 만드는 상큼한 레몬에이드", forHere: true),
    Drinks(name: "Iced Tea", price: 3.4, description: "직접 유기농 홍차를 우려낸 아이스티", forHere: true),
    Drinks(name: "Fifty/Fifty", price: 3.5, description: "레몬에이드와 아이스티의 만남", forHere: true),
    Drinks(name: "Fountain Soda", price: 2.7, description: "코카콜라 / 스프라이트 / 환타 오렌지 / 환타 그레이프", forHere: true),
    Drinks(name: "Root Beer", price: 4.4, description: "청량감 있는 독특한 미국식 무알콜 탄산음료", forHere: true),
    Drinks(name: "Bottled Water", price: 1.0, description: "지리산 암반대수층으로 만든 프리미엄 생수", forHere: true)
]

func drinks() {
    while true{
        print("주문할 메뉴의 번호를 입력해주세요.")
        print()
        for idx in 0..<drinksMenu.count {
            drinksMenu[idx].displayInfo(at: idx)
        }
        print("0. 뒤로가기 | 뒤로가기")
        let drinknumber = Int(readLine()!)!
        if drinknumber == 1 || drinknumber == 2 || drinknumber == 3 || drinknumber == 4 || drinknumber == 5 || drinknumber == 6 {
            print("\(drinknumber)번 메뉴를 주문하시겠습니까?")
            while true {
                print("매장컵을 이용하시겠습니까? y/n (일회용컵 이용 시 300원 추가)")
                let cupInput = readLine()!
                if cupInput == "y" {
                    print("음료가 매장컵에 준비됩니다.")
                    print(drinksMenu[drinknumber].forHere)
                    break
                } else if cupInput == "n" {
                    drinksMenu[drinknumber - 1].forHere = !drinksMenu[drinknumber].forHere
                    print("음료가 일회용컵에 준비됩니다.")
                    print(drinksMenu[drinknumber - 1].forHere)
                    // 주문한 drinks 메뉴의 drinksMenu[drinknumber].forHere = true 인 경우 장바구니 total price에서 + 300
                    break
                }
                else {
                    print("잘못 입력되었습니다.")
                }
            }
        } else if drinknumber == 0 {
            break
        } else {
            print("잘못된 번호를 입력했어요. 다시 입력해주세요.")
        }
    }
}

while true {
    print(mainMenu)
    let number = Int(readLine()!)!

    if number == 0 {
        print("프로그램을 종료합니다.")
        break
    } else if number == 1 {
        print(burgersMenu)
        let burgersNumber = Int(readLine()!)!
        if burgersNumber == 0 {}
        else {
            print("잘못된 번호를 입력했어요. 다시 입력해주세요.")
        }
    } else if number == 3 {
        drinks()
    } else {
        print("잘못된 번호를 입력했어요. 다시 입력해주세요.")
    }
}
