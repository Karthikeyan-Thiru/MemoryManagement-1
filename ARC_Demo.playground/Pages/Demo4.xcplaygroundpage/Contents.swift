//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
        print("Customer \(name) has been initialized")
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
        print("Card #\(number) has been initialized")
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

var keinTheUser: Customer?
keinTheUser = Customer(name: "Kevin")
if let user = keinTheUser {
    keinTheUser = nil
    let hdfcCreditCard = CreditCard(number: 12345678900, customer: user)
    print("\(hdfcCreditCard.customer.name)")
}



//: [Next](@next)
