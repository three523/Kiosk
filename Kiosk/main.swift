//
//  main.swift
//  Kiosk
//
//  Created by 김도현 on 2023/07/24.
//

import Foundation

let mainMenu = """
SHAKESHACK BURGER 에 오신걸 환영합니다.
아래 메뉴판을 보시고 메뉴를 골라 번호를 입력해주세요.

[ SHAKESHACK MENU ]
1. Burgers         | 앵거스 비프 통살을 다져만든 버거
2. Frozen Custard  | 매장에서 신선하게 만드는 아이스크림
3. Drinks          | 매장에서 직접 만드는 음료
4. Beer            | 뉴욕 브루클린 브루어리에서 양조한 맥주
0. 종료            | 프로그램 종료
"""

var burgerShoppingBag: [Burger] = []

//var 리스트변수: [클래스타입] = []
let burgers: [Burger] = [
    //붕어빵5개 - 같은 틀이지만 내용이 다르다 . 인스턴스가 다르다 ,burgers는 Burger라는 배열의 타입을 갖는다.
    Burger(name: "ShackBurger", price: "W 6.9", description: "토마토, 양상추, 쉑소스가 토핑된 치즈버거"),
    Burger(name: "SmokeShack" , price: "W 8.9", description: "베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거"),
    Burger(name: "Shroom Burger", price: "W 9.4", description: "몬스터 치즈와 체다 치즈로 속을 채운 베지테리안버거"),
    Burger(name: "Cheeseburger", price: "W 6.9", description: "포테이토 번과 비프패티, 치즈가 토핑된 치즈버거"),
    Burger(name: "Hamburger", price: "W 5.4", description: "비프패티를 기반으로 야채가 들어간 기본버거")
]


func mainMenus() {
    var showMainMenu = true //flag변수 - true/false를 통해 mainMenu출력 여부 결정

    while true {
        if showMainMenu {
            print(mainMenu)
        }
        
        showMainMenu = true
        //default에서 false로 설정을 했기때문에 여기서 true로 바꿔주지않으면 위에 있는 if문에 있는 print문이 절대 출력 안됨.
        
        guard let input = Int(readLine() ?? "") else {
            print("문자를 입력했어요. 유효한 숫자를 다시 입력해주세요.")
            showMainMenu = false // 다시 입력할 때 메뉴 다시 안보여지게 false처리.
            continue //문자 입력시 return되는 문제를 continue로 해결함. switch문으로 안가고 처음으로 돌아감. false니까 while문의 첫번째로 돌아가도 mainMenu 다시 출력 안함. 그리고 42번째 줄에서 true로 바뀜.
        }
        
        switch input {
        case 0:
            print("프로그램이 종료되었습니다.")
            return
        case 1:
            burgerMenu()
        case 2: break
        case 3: break
        case 4: break
        default :
            print("잘못된 번호를 입력했어요. 다시 입력해주세요.") //숫자일때 다시 입력하게는 하지만 문자입력시 return해버림.
            showMainMenu = false
        }
    }
}


func burgerMenu() {
    var showBurgerMenu = true
    
    while true {
        if showBurgerMenu {
            print("[ Burgers MENU ]")
            for index in 0..<burgers.count {
                burgers[index].display(num: "\(index+1). ") //문자열템플릿
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
            return //func burgerMenu()자체가 종료됨.
        }
               
        addBurgerInShoppingBag(burger: burgers[input-1])//guard let에 있는 input에 햄버거 번호가 들어오면 else문을 실행하지 않고 바로 여기로 와서 쇼핑백func가 돌아감.
        
        return
    }
}

mainMenus()
    
func addBurgerInShoppingBag(burger: Burger) {
    var showAddGuideLabel = true
    while true {
        if showAddGuideLabel {
            burger.display(num: "")
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
            print("\(burger.name)이(가) 장바구니에 추가되었습니다.")
            burgerShoppingBag.append(burger)
            print()
            return
        } else {
            print("장바구니에 메뉴를 추가하세요.")
            print()
            return
        }
    }
}
