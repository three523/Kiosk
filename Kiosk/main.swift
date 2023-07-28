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

var totalPrice: Double = 0

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
        print("\(index + 1). \(name) | W \(price) | \(description)")
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
]

func drinks() {
    print("주문할 메뉴의 번호를 입력해주세요.")
    print()
    print("[ Drinks MENU ]")
    for idx in 0..<drinksMenu.count {
        drinksMenu[idx].displayInfo(at: idx)
    }
    print("0. 뒤로가기 | 뒤로가기")
    while true {
        let drinknumber = Int(readLine()!)!
        if drinknumber == 1 || drinknumber == 2 || drinknumber == 3 || drinknumber == 4 || drinknumber == 5 {
            // 장바구니 함수
            print("\(drinksMenu[drinknumber - 1].name)를 장바구니에 추가하시겠습니까?")
            print("1. 확인        2. 취소")
            let addBagInput = readLine()!
            if addBagInput == "1" {
                print("\(drinksMenu[drinknumber - 1].name)가 장바구니에 추가되었습니다.")
                totalPrice += drinksMenu[drinknumber - 1].price
                // 장바구니 [Orders] 에 추가
                if orders.first == "비어있음" {
                    orders[0] = ("\(drinksMenu[drinknumber - 1].name) | W \(drinksMenu[drinknumber - 1].price) | \(drinksMenu[drinknumber - 1].description)")
                } else {
                    orders.append("\(drinksMenu[drinknumber - 1].name) | W \(drinksMenu[drinknumber - 1].price) | \(drinksMenu[drinknumber - 1].description)")
                }
                // totalPrice 에 + drinksMenu[drinknumber - 1].price
                while true {
                    print("테이크 아웃 하시겠습니까? y/n (테이크 아웃 시 일회용컵 300원 추가)")
                    let cupInput = readLine()!
                    if cupInput == "y" {
                        totalPrice += 0.3
                        drinksMenu[drinknumber - 1].forHere = !drinksMenu[drinknumber - 1].forHere
                        print("음료가 일회용컵에 준비됩니다.")
                        //print(drinksMenu[drinknumber - 1].forHere)
                        orders.append("일회용컵 +300원")
                        // 주문한 drinks 메뉴의 forHere = false 인 경우 total price += 300, 장바구니에 "일회용컵 +300" 추가
                        break
                    } else if cupInput == "n" {
                        print("음료가 매장컵에 준비됩니다.")
                        //print(drinksMenu[drinknumber - 1].forHere)
                        break
                    } else {
                        print("잘못 입력되었습니다.")
                    }
                }
            } else if addBagInput == "2" {
                print("취소되었습니다.")
            }
            print("1. 메인 메뉴로 이동 2. 장바구니로 이동")
            let goToInput = readLine()!
            if goToInput == "1" {
                main()
            } else if goToInput == "2" {
                // 장바구니 [Orders] 로 이동
                shoppingBag()
            }
        } else if drinknumber == 0 {
            main()
            break
        } else {
            print("잘못된 번호를 입력했어요. 다시 입력해주세요.")
        }
    }
}

func shoppingBag() {
    print ("아래와 같이 주문 하시겠습니까?")
    print("[ Orders ]")
    for order in orders{
        print(order)
    }
    print()
    print("[ Total ]")
    print("W \(totalPrice)")
}

func main() {
    print(mainMenu)
    
    while true {
        let number = Int(readLine()!)!
        
        if number == 0 {
            print("프로그램을 종료합니다.")
            break
        } else if number == 1 {
//            print(burgersMenu)
//            let burgersNumber = Int(readLine()!)!
//            if burgersNumber == 0 {}
//            else {
//                print("잘못된 번호를 입력했어요. 다시 입력해주세요.")
//            }
        } else if number == 3 {
            drinks()
        } else {
            print("잘못된 번호를 입력했어요. 다시 입력해주세요.")
        }
    }
}

var orders: [String] = ["비어있음"]

print("SHAKESHACK BURGER 에 오신걸 환영합니다.")
main()
