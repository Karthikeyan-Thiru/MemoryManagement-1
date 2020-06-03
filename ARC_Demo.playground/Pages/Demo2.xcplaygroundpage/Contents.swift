//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

class User {
    let name: String
    let id  : String
    var app : Application?
//    weak var app : Application?
    
    init(userName:String, userID:String) {
        self.name   = userName
        self.id     = userID
        print("User \(name) with an ID \(id) is being initailized")
    }
    
    deinit {
        print("User \(name) with an ID \(id) is being deinitailized")
    }
}


class Application {
    let name : String
    let id   : String
    var user : User?
    
    init(appName:String, appID:String) {
        self.name   = appName
        self.id     = appID
        print("App \(name) with an ID \(id) is being initailized")
    }
    
    deinit {
        print("App \(name) with an ID \(id) is being deinitailized")
    }
}

//Case1 - without Strong Reference Cycle
do {
    let _ = User(userName: "kevin", userID: "kevin.r@gmail.com")
    let _ = Application(appName: "Music", appID: "com.kevin.user")
}

//User kevin with an ID kevin.r@gmail.com is being initailized
//App Music with an ID com.kevin.user is being initailized

//App Music with an ID com.kevin.user is being deinitailized
//User kevin with an ID kevin.r@gmail.com is being deinitailized


//Case2 - Strong Reference Cycle
do {
    print("\n\n")
    let kevinTheUser     = User(userName: "kevin", userID: "kevin.r@gmail.com")
    let musicApplication = Application(appName: "Music", appID: "com.kevin.user")
    
    kevinTheUser.app        = musicApplication
    musicApplication.user   = kevinTheUser
}

//User kevin with an ID kevin.r@gmail.com is being initailized
//App Music with an ID com.kevin.user is being initailized

/**** case3 - Break the Strong Reference Cycle by comment the code @ Line #10 and uncomment the code @ Line #11  ****/
//User kevin with an ID kevin.r@gmail.com is being initailized
//App Music with an ID com.kevin.user is being initailized
//App Music with an ID com.kevin.user is being deinitailized
//User kevin with an ID kevin.r@gmail.com is being deinitailized

//: [Next](@next)
