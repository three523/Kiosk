import Foundation

class FrogenCustard: Food {
//    var name: String
//    var price: String
//    var description: String
//
//    init(name: String, price: String, description: String) {
//        self.name = name
//        self.price = price
//        self.description = description
//    }
//
//    func display(num: Int) {
//        print("\(num).\(name) + | \(price) | + \(description)")
//    }
    
    func serviceSpon() {
        
        print("스푼 드릴까요? \n1번: o , 2번: x")
        
        guard let input1 = readLine(), let selectedOption1 = Int(input1) else {
            print("잘못된 입력입니다. 숫자를 입력해주세요.")
            return
        }
        
        switch selectedOption1 {
        case 1:
            print("spon 드리기")
            
        case 2:
            print("spon 안드리기")
            
        default:
            print("잘못된 입력입니다.")
            serviceSpon()
            
        }
    }
}
