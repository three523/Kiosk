func displayMainMenu() {
    print("[ SHAKESHACK MENU ]")
    print("1. Burgers         | 앵거스 비프 통살을 다져만든 버거")
    print("2. Frozen Custard  | 매장에서 신선하게 만드는 아이스크림")
    print("3. Drinks          | 매장에서 직접 만드는 음료")
    print("4. Beer            | 뉴욕 브루클린 브루어리에서 양조한 맥주")
    print("0. 종료            | 프로그램 종료")
}

func displayBurgersMenu() {
    print("[ Burgers MENU ]")
    print("1. ShackBurger   | W 6.9 | 토마토, 양상추, 쉑소스가 토핑된 치즈버거")
    print("2. SmokeShack    | W 8.9 | 베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거")
    print("3. Shroom Burger | W 9.4 | 몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거")
    print("4. Cheeseburger  | W 6.9 | 포테이토 번과 비프패티, 치즈가 토핑된 치즈버거")
    print("5. Hamburger     | W 5.4 | 비프패티를 기반으로 야채가 들어간 기본버거")
    print("0. 뒤로가기      | 뒤로가기")
}

func main() {
    var choice: Int

    while true {
        displayMainMenu()

        guard let input = readLine(), let selectedOption = Int(input) else {
            print("잘못된 입력입니다. 숫자를 입력해주세요.")
            continue
        }

        choice = selectedOption

        switch choice {
        case 1:
            while true {
                displayBurgersMenu()

                guard let subInput = readLine(), let subSelectedOption = Int(subInput) else {
                    print("잘못된 입력입니다. 숫자를 입력해주세요.")
                    continue
                }

                let subChoice = subSelectedOption

                switch subChoice {
                case 1:
                    print("ShackBurger를 선택하셨습니다.")
                case 2:
                    print("SmokeShack를 선택하셨습니다.")
                case 3:
                    print("Shroom Burger를 선택하셨습니다.")
                case 4:
                    print("Cheeseburger를 선택하셨습니다.")
                case 5:
                    print("Hamburger를 선택하셨습니다.")
                case 0:
                    break
                default:
                    print("잘못된 번호를 선택하셨습니다.")
                }
                
                if subChoice == 0 {
                    break
                }
            }
        case 2:
            print("Frozen Custard 메뉴를 선택하셨습니다.")
        case 3:
            print("Drinks 메뉴를 선택하셨습니다.")
        case 4:
            print("Beer 메뉴를 선택하셨습니다.")
        case 0:
            print("프로그램을 종료합니다.")
            return // 프로그램 종료 //break랑 같은 의미
        default:
            print("잘못된 번호를 선택하셨습니다. 다시 선택해주세요.")
        }
    }
}

main()

