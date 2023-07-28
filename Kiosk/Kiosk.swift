//
//  Order.swift
//  Kiosk
//
//  Created by 김도현 on 2023/07/28.
//

import Foundation

class Kiosk {
    // 버거 프로퍼티, 아이스크림 프로퍼티, 음료 프로퍼티 추가하기
    var beers: [Beer] = [
        Beer(name: "ShackMeister Ale", price: 9.8, description: "쉐이크쉑 버거를 위해 뉴욕 브루클린 브루어리에서 특별히 양조한 에일 맥주"),
        Beer(name: "Magpie Brewing Co.", price: 6.8, description: "Pale Ale / Draft")
    ]
    
    let drinksMenu: [Drinks] = [
        Drinks(name: "Lemonade", price: 3.9, description: "매장에서 직접 만드는 상큼한 레몬에이드", takeOut: true),
        Drinks(name: "Iced Tea", price: 3.4, description: "직접 유기농 홍차를 우려낸 아이스티", takeOut: true),
        Drinks(name: "Fifty/Fifty", price: 3.5, description: "레몬에이드와 아이스티의 만남", takeOut: true),
        Drinks(name: "Fountain Soda", price: 2.7, description: "코카콜라 / 스프라이트 / 환타 오렌지 / 환타 그레이프", takeOut: true),
        Drinks(name: "Root Beer", price: 4.4, description: "청량감 있는 독특한 미국식 무알콜 탄산음료", takeOut: true)
    ]
    
    //var 리스트변수: [클래스타입] = []
    let burgers: [Burger] = [
        //붕어빵5개 - 같은 틀이지만 내용이 다르다 . 인스턴스가 다르다 ,burgers는 Burger라는 배열의 타입을 갖는다.
        Burger(name: "ShackBurger", price: 6.9, description: "토마토, 양상추, 쉑소스가 토핑된 치즈버거"),
        Burger(name: "SmokeShack" , price: 8.9, description: "베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거"),
        Burger(name: "Shroom Burger", price: 9.4, description: "몬스터 치즈와 체다 치즈로 속을 채운 베지테리안버거"),
        Burger(name: "Cheeseburger", price: 6.9, description: "포테이토 번과 비프패티, 치즈가 토핑된 치즈버거"),
        Burger(name: "Hamburger", price: 5.4, description: "비프패티를 기반으로 야채가 들어간 기본버거")
    ]
    
        
    let frozenMenu: [FrogenCustard] = [
        FrogenCustard(name: "Shakes", price: 5.9, description: "바닐라 / 초콜릿 / 솔티드 카라멜 / 스트로베리 / 피넛버터 /커피"),
        FrogenCustard(name: "Float" , price: 5.9, description: "루트 비어 / 퍼플 카우 / 크림시클"),
        FrogenCustard(name: "Cups&Cones", price: 4.9, description: "바닐라 / 초콜렛")
    ]
    
    var shoppingBag: [Food] = []
    
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
    
    func displayFrozenMenu() {
        
        print("[ FROGENCUSTARD MENU ]")
        
        for index in 0..<frozenMenu.count {
            frozenMenu[index].displayInfo(at: index+1)
        }
        print("0.뒤로가기")
        
        guard let input = readLine(), let selectedOption = Int(input) else {
            print("잘못된 입력입니다. 숫자를 입력해주세요.")
            return
        }
        
        switch selectedOption {
            
        case 1:
            print("Shakes를 선택하셨습니다.")
            let frozen = frozenMenu[1]
            frozen.serviceSpon()
        
        case 2:
            print("Float를 선택하셨습니다.")
            
        case 3:
            print("Cups&Cones를 선택하셨습니다.")
        case 0:
            print("뒤로가기를 선택하셨습니다") // 뒤로가기, 함수 종료
        default:
            print("잘못된 번호를 선택하셨습니다.")
        }
    }
    
    func beerMenu() {
        var showBeerMenu = true
        
        while showBeerMenu {
            print()
            print("주문할 메뉴의 번호를 입력해주세요.")
            print("[ Beers MENU ]")
            for index in 0..<beers.count {
                beers[index].displayInfo(at: index)
            }
            print("0. 뒤로가기 | 뒤로가기")
            guard let input = Int(readLine() ?? ""),
                  input >= 0 && input <= beers.count + 1 else {
                print("잘못입력하였습니다.")
                return
            }
            let index = input - 1
            if index == -1 {
                print()
                run()
            } else {
                addShoppingBag(food: beers[index])
            }
            showBeerMenu = false
        }
    }
    
    func drinks() {
        print()
        var showBeerMenu = true
        
        while showBeerMenu {
            print()
            print("주문할 메뉴의 번호를 입력해주세요.")
            print("[ Drinks MENU ]")
            for idx in 0..<drinksMenu.count {
                drinksMenu[idx].displayInfo(at: idx)
            }
            print("0. 뒤로가기 | 뒤로가기")
            guard let input = Int(readLine() ?? ""),
                  input >= 0 && input <= drinksMenu.count + 1 else {
                print("잘못입력하였습니다.")
                return
            }
            let index = input - 1
            if index == -1 {
                print()
                run()
            } else {
                addShoppingBag(food: drinksMenu[index].create())
            }
            showBeerMenu = false
        }
    }
    
    func takeOut(drink: Drinks) {
        while true{
            print("테이크 아웃 하시겠습니까? (테이크 아웃 시 일회용컵 300원 추가)")
            print("1. 예        2. 아니오")
            guard let cupInput = readLine(),
                  let cupInput = Int(cupInput) else { return }
            if cupInput == 1 {
                print("음료가 일회용컵에 준비됩니다.")
                drink.takeOut = true
                break
            } else if cupInput == 2 {
                print("음료가 매장컵에 준비됩니다.")
                drink.takeOut = false
                break
            } else {
                print("잘못 입력되었습니다.")
            }
        }
    }
    
    func burgerMenu() {
        var showBurgerMenu = true
        
        while true {
            if showBurgerMenu {
                print()
                print("주문할 메뉴의 번호를 입력해주세요.")
                print("[ Burgers MENU ]")
                for index in 0..<burgers.count {
                    burgers[index].displayInfo(at: index) //문자열템플릿
                }
                print("0. 뒤로가기 | 뒤로가기")
            }
            
            guard let input = Int(readLine() ?? ""),  //??닐 병합연산자, 닐이면 ""반환, 아니면 readline반환 후 input에 값 대입
                  input >= 0 && input <= burgers.count else {  // && 논리곱
                print("잘못된 번호를 입력했어요. 다시 입력해주세요.")
                showBurgerMenu = false
                continue //잘못된 번호를 입력했을 때 return해서 다시 메인메뉴를 보여주는게 아니라 continue해서 다시 버거 메뉴를 보여줘야함.
            }
            print() // 숫자 입력하고 한 줄 띄워줌
            
            if input == 0 {
                //return //func burgerMenu()자체가 종료됨.
                run()
            }
            addShoppingBag(food: burgers[input - 1])//guard let에 있는 input에 햄버거 번호가 들어오면 else문을 실행하지 않고 바로 여기로 와서 쇼핑백func가 돌아감.
            
            return
        }
    }
        
    func addShoppingBag(food: Food) {
        var showAddGuideLabel = true
        while true {
            if showAddGuideLabel {
                print("\(food.name) | W \(food.price) | \(food.description)")
                print("위 메뉴를 장바구니에 추가하시겠습니까?")
                print("1. 확인        2. 취소")
            }
            
            showAddGuideLabel = true
            
            guard let input = Int(readLine() ?? ""),
                  input == 1 || input == 2 else {
                showAddGuideLabel = false
                continue
            }
            
            if input == 1 {
                print("\(food.name)이(가) 장바구니에 추가되었습니다.")
                if let drink = food as? Drinks {
                    takeOut(drink: drink)
                    shoppingBag.append(drink)
                } else {
                    shoppingBag.append(food)
                }
                print()
                break
            } else {
                print("취소되었습니다.")
                break
            }
        }
        goToMenu()
    }
    func showTotalPrice() -> Double {
        var resultPrice = 0.0
        shoppingBag.forEach { food in
            resultPrice += food.price
        }
        return resultPrice
    }
    
    func goToMenu() {
        var repeatGoToMenu = true
        
        while repeatGoToMenu {
            print("1. 메인 메뉴로 이동        2. 장바구니로 이동")
            guard let goToInput = readLine() else { return }
            if goToInput == "1" {
                repeatGoToMenu = false
                print()
                run()
            } else if goToInput == "2" {
                // 장바구니 [Orders] 로 이동
                repeatGoToMenu = false
                showShoppingBag()
            } else {
                print("잘못 입력되었습니다.")
            }
        }
    }
    
    func showShoppingBag() {
        print ("아래와 같이 주문 하시겠습니까?")
        print()
        print("[ Orders ]")
        if shoppingBag.isEmpty {
            print("장바구니가 비어있습니다.")
        } else {
            for index in 0..<shoppingBag.count {
                shoppingBag[index].displayInfo(at: index)
            }
        }
        let totalPrice = showTotalPrice()
        print()
        print("""
        [ Total ]
        W \(round(totalPrice * 100) / 100)
        
        1. 계속 쇼핑하기     2. 결제하기
        """)
        guard let finalOption = readLine(),
              let finalOption = Int(finalOption) else { return }
        if finalOption == 1 {
            print()
            run()
        } else if finalOption == 2 {
            payment(totalPrice: totalPrice)
        }
    }
    
    func payment(totalPrice: Double) {
        let balance = 10.5
        if totalPrice <= balance {
            print("결제되었습니다.")
        } else {
            print("현재 잔액은 W \(balance) 로 W \(round((totalPrice - balance) * 100) / 100) 가(이) 부족해서 주문할 수 없습니다.")
        }
    }
    
    
    func run() {
        var run = true
        
        while run {
            showBaseMenu()
            guard let input = readLine() else { return }
            switch MainMenu(rawValue: input) {
            case.burger:
                burgerMenu()
                run = false
            case.fronzenCustard:
                displayFrozenMenu()
            case.drink:
                drinks()
                run = false
            case.beer:
                beerMenu()
                run = false
            case.exit:
                print("종료되었습니다")
                run = false
                return
            case .none:
                print("잘못된 입력입니다.")
            }
        }
    }
}
