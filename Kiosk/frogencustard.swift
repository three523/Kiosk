import Foundation
class FrogenCustard {
  var name: String
  var price: String
  var description: String
  init(name: String, price: String, description: String) {
    self.name = name
    self.price = price
    self.description = description
  }
  func display() {
    print("1. \(name) + | \(price) | + \(description)")
  }
}
