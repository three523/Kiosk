//
//  main.swift
//  Kiosk
//
//  Created by 김도현 on 2023/07/24.
//

import Foundation



print("""
아래 메뉴판을 보시고 메뉴를 골라 입력해주세요.

      [ SHAKESHACK MENU ]
      1. Burgers         | 앵거스 비프 통살을 다져만든 버거
      2. Frozen Custard  | 매장에서 신선하게 만드는 아이스크림
      3. Drinks          | 매장에서 직접 만드는 음료
      4. Beer            | 뉴욕 브루클린 브루어리에서 양조한 맥주
      0. 종료            | 프로그램 종료
""") //Multi-lint string


let menuNumber = readLine() ?? "" //??닐병합연산자 , readLine이 옵셔널이면 ?? ""으로 바꿔주세요
print("선택한 메뉴는 \(menuNumber) 입니다.")
var message = String()

switch menuNumber {
case "1" :
    message = """
[ Burgers MENU ]
    1. ShackBurger   | W 6.9 | 토마토, 양상추, 쉑소스가 토핑된 치즈버거
    2. SmokeShack    | W 8.9 | 베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거
    3. Shroom Burger | W 9.4 | 몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거
    4. Cheeseburger  | W 6.9 | 포테이토 번과 비프패티, 치즈가 토핑된 치즈버거
    5. Hamburger     | W 5.4 | 비프패티를 기반으로 야채가 들어간 기본버거
    0. 뒤로가기      | 뒤로가기
"""
case "2" :
    message = """
[ Frozen Custard MENU ]
    1. Shakes            | W 5.9 | 바닐라, 초콜렛, 솔티드카라멜, 블랙&화이트, 스트로베리, 피넛버터, 커피
    2. Shake of the Week | W 6.5 | 특별한 커스터드 플레이버
    3. Red Bean Shake    | W 6.5 | 신선한 커스터드와 함께 우유와 레드빈이 블렌딩 된 시즈널 쉐이크
    4. Floats            | W 5.9 | 루트비어, 퍼플카우, 크림시클
    0. 뒤로가기      | 뒤로가기
"""
case "3" :
    message = """
[ Drinks MENU ]
    1. Lemonade | W 3.9 | 매장에서 직접 만드는 상큼한 레몬에이드
    2. Iced Tea | W 3.4 | 직접 유기농 홍차를 우려낸 아이스티
    3. Fifty/Fifty | W 3.5 | 레몬에이드와 아이스티의 만남
    4. Fountain Soda| W 2.7 | 코카콜라 / 스프라이트 / 환타 오렌지 / 환타 그레이프
    5. Root Beer | W 4.4 | 청량감 있는 독특한 미국식 무알콜 탄산음료
    6. Bottled Water| W 1.0 | 지리산 암반대수층으로 만든 프리미엄 생수
    0. 뒤로가기 | 뒤로가기
"""
case "4" :
    message = """
[Beer MENU]
1.
2.

"""
    
    
default:
    message = "잘못 입력하셨습니다."
}
print(message)


//숫자 입력받는 곳 만들기
//숫자마다 보여줄 메뉴판 만들기

