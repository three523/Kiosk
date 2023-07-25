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

class Kiosk {
    // 버거 프로퍼티, 아이스크림 프로퍼티, 음료 프로퍼티 추가하기
    var beers: [Beer] = [
        Beer(name: "ShackMeister Ale", descripton: "쉐이크쉑 버거를 위해 뉴욕 브루클린 브루어리에서 특별히 양조한 에일 맥주", price: 9800),
        Beer(name: "Magpie Brewing Co.", descripton: "Pale Ale / Draft", price: 6800)
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
    
    func showShoppingBag() {
        // 쇼핑백 리스트 보여주기
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
                print("Drink")
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

