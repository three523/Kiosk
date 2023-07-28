//
//  main.swift
//  Kiosk
//
//  Created by 김도현 on 2023/07/24.
//


import Foundation

enum MainMenu: String {
    case burger = "1"
    case fronzenCustard = "2"
    case drink = "3"
    case beer = "4"
    case exit = "0"
}

var orders: [String] = ["비어있음"]
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
    var takeOut: Bool = true
    
    init(name: String, price: Double, description: String, takeOut: Bool) {
        super.init(name: name, price: price, description: description)
    }
}

class Kiosk {
    // 버거 프로퍼티, 아이스크림 프로퍼티, 음료 프로퍼티 추가하기
    var beers: [Beer] = [
        Beer(name: "ShackMeister Ale", descripton: "쉐이크쉑 버거를 위해 뉴욕 브루클린 브루어리에서 특별히 양조한 에일 맥주", price: 9800),
        Beer(name: "Magpie Brewing Co.", descripton: "Pale Ale / Draft", price: 6800)
    ]
    let drinksMenu: [Drinks] = [
        Drinks(name: "Lemonade", price: 3.9, description: "매장에서 직접 만드는 상큼한 레몬에이드", takeOut: true),
        Drinks(name: "Iced Tea", price: 3.4, description: "직접 유기농 홍차를 우려낸 아이스티", takeOut: true),
        Drinks(name: "Fifty/Fifty", price: 3.5, description: "레몬에이드와 아이스티의 만남", takeOut: true),
        Drinks(name: "Fountain Soda", price: 2.7, description: "코카콜라 / 스프라이트 / 환타 오렌지 / 환타 그레이프", takeOut: true),
        Drinks(name: "Root Beer", price: 4.4, description: "청량감 있는 독특한 미국식 무알콜 탄산음료", takeOut: true),
    ]
    
    var shoppingBag: [Beer] = [] // 지금은 Bear로 되어있지만 Food 클래스를 만들어서 모든 음식들을 담을수 있는 shoppingBag 변수만들기
    
    func showBaseMenu() {
        print("""
        아래 메뉴판을 보시고 메뉴를 골라 번호를 입력해주세요.
        [ SHAKESHACK MENU ]
        1. Burgers         | 앵거스 비프 통살을 다져만든 버거
        2. Frozen Custard  | 매장에서 신선하게 만드는 아이스크림
        3. Drinks          | 매장에서 직접 만드는 음료
        4. Beer            | 뉴욕 브루클린 브루어리에서 양조한 맥주
        0. 종료            | 프로그램 종료
        """)
    }
    
    func beerMenu() {
        while true {
            print()
            print("[ Beers MENU ]")
            for index in 0..<beers.count {
                beers[index].displayInfo(index: index)
            }
            print("0. 뒤로가기 | 뒤로가기")
            guard let input = Int(readLine() ?? ""),
                  input > 0 && input <= beers.count + 1 else {
                print("잘못입력하였습니다.")
                return
            }
            let index = input - 1
            if index == -1 {
                return
            } else {
                addShoppingBag(beer: beers[index])
            }
        }
    }
    
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
                    // totalPrice 에 + drinksMenu[drinknumber - 1].price
                    totalPrice += drinksMenu[drinknumber - 1].price
                    // 장바구니 [Orders] 에 추가
                    if orders.first == "비어있음" {
                        orders[0] = ("\(drinksMenu[drinknumber - 1].name) | W \(drinksMenu[drinknumber - 1].price) | \(drinksMenu[drinknumber - 1].description)")
                    } else {
                        orders.append("\(drinksMenu[drinknumber - 1].name) | W \(drinksMenu[drinknumber - 1].price) | \(drinksMenu[drinknumber - 1].description)")
                    }
                    while true {
                        print("테이크 아웃 하시겠습니까? y/n (테이크 아웃 시 일회용컵 300원 추가)")
                        let cupInput = readLine()!
                        if cupInput == "y" {
                            totalPrice += 0.3
                            print("음료가 일회용컵에 준비됩니다.")
                            orders.append("일회용컵 +300원")
                            drinksMenu[drinknumber - 1].takeOut = true
                            // 테이크 아웃 하시겠습니까? y 선택할 경우 total price += 300, 장바구니에 "일회용컵 +300" 추가
                            print(drinksMenu[drinknumber - 1].takeOut)
                            break
                        } else if cupInput == "n" {
                            print("음료가 매장컵에 준비됩니다.")
                            drinksMenu[drinknumber - 1].takeOut = false
                            print(drinksMenu[drinknumber - 1].takeOut)
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
                    return
                } else if goToInput == "2" {
                    // 장바구니 [Orders] 로 이동
                    showShoppingBag()
                }
            } else if drinknumber == 0 {
                return
            } else {
                print("잘못된 번호를 입력했어요. 다시 입력해주세요.")
            }
        }
    }

    func showShoppingBag() {
        print ("아래와 같이 주문 하시겠습니까?")
        print("[ Orders ]")
        for order in orders{
            print(order)
        }
        print()
        print("[ Total ]")
        print("W \(totalPrice)")
    }
    
    func addShoppingBag(beer: Beer) {
        print("\(beer.name)을 장바구니에 담으시겠습니까? (y/n)")
        guard let result = readLine() else {
            print("잘못입력하였습니다.")
            return
        }
        if result == "y" {
            shoppingBag.append(beer)
            print("\(beer.name)이 담겼습니다.")
        } else if result == "n" {
            print("\(beer.name)을 담지 않습니다.")
        } else {
            print("잘못입력하였습니다.")
        }
    }
    
    func showShoppingBagPrice() -> Int {
        // 쇼핑백에 있는 음식들의 가격 총합을 반환하는 함수
        return 0
    }
    
    func run() {
        while true {
            showBaseMenu()
            guard let input = readLine() else { return }
            switch MainMenu(rawValue: input) {
            case.burger:
                print("Burger")
            case.fronzenCustard:
                print("FronzenCustard")
            case.drink:
                drinks()
            case.beer:
                beerMenu()
            case.exit:
                print("종료되었습니다")
                return
            case .none:
                print("잘못된 입력입니다.")
            }
        }
    }
}

let kiosk = Kiosk()
kiosk.run()
