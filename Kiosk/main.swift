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

/*
let frozenMenu = """
[ Frozen Custard MENU ]
1. Shakes     | W 5.9 | 바닐라 / 초콜릿 / 솔티드 카라멜 / 스트로베리 / 피넛버터 /커피
2. Float      | W 5.9 | 루트 비어 / 퍼플 카우 / 크림시클
3. Cups&Cones | W 4.9 | 바닐라 / 초콜렛
0. 뒤로가기     | 뒤로가기
"""

let drinksMenu = """
[ Drinks MENU ]
1. Lemonade     | W 3.9 | 매장에서 직접 만드는 상큼한 레몬에이드
2. Iced Tea     | W 3.4 | 직접 유기농 홍차를 우려낸 아이스티
3. Fifty/Fifty  | W 3.5 | 레몬에이드와 아이스티의 만남
4. Fountain Soda| W 2.7 | 코카콜라 / 스프라이트 / 환타 오렌지 / 환타 그레이프
5. Root Beer    | W 4.4 | 청량감 있는 독특한 미국식 무알콜 탄산음료
6. Bottled Water| W 1.0 | 지리산 암반대수층으로 만든 프리미엄 생수
0. 뒤로가기      | 뒤로가기
"""
*/

while true {
    print(mainMenu)
    let number = Int(readLine()!)!
    
    if number == 0 {
        print("프로그램을 종료합니다.")
        break
    } else if number == 1 {
        print(burgersMenu)
        let burgersNumber = Int(readLine()!)!
        if burgersNumber == 0 {
            continue
        }
        else {
            print("잘못된 번호를 입력했어요. 다시 입력해주세요.")
        }
    } else {
        print("잘못된 번호를 입력했어요. 다시 입력해주세요.")
    }
}

