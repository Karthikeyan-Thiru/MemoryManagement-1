//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

class User {
    let name        : String
    let id          : String
    lazy var details: () -> String = { [unowned self] in
        return ("Name = \( self.name ) and ID = \(  self.id )")
    }
    
    init(userName:String, userID:String) {
        self.name   = userName
        self.id     = userID
        print("User \(name) with an ID \(id) is being initailized")
    }
    
    deinit {
        print("User \(name) with an ID \(id) is being deinitailized")
    }
}

do {
    let user = User(userName: "kevin", userID: "kevin.r@gmail.com")
    print(user.details())
}

//User kevin with an ID kevin.r@gmail.com is being initailized
//Name = kevin and ID = kevin.r@gmail.com

// uncomment the code in Line #10 and run the playground
//User kevin with an ID kevin.r@gmail.com is being initailized
//Name = kevin and ID = kevin.r@gmail.com
//User kevin with an ID kevin.r@gmail.com is being deinitailized

//: [Next](@next)
