//: [Previous](@previous)


class User {
    let name: String
    let id  : String
    
    init(userName:String, userID:String) {
        self.name   = userName
        self.id     = userID
        print("User \(name) with an ID \(id) is being initailized")
    }
    
    deinit {
        print("User \(name) with an ID \(id) is being deinitailized")
    }
}

var user1 : User?
var user2 : User?
var user3 : User?

user1 = User(userName: "kevin", userID: "kevin.r@gmail.com")
//User kevin with an ID kevin.r@gmail.com is being initailized

user2 = user1
//User kevin with an ID kevin.r@gmail.com is being initailized

user3 = user1
//User kevin with an ID kevin.r@gmail.com is being initailized

user1 = nil
user2 = nil
user3 = nil
//User kevin with an ID kevin.r@gmail.com is being deinitailized
//: [Next](@next)
