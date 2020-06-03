//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

class User {
    let name        : String
    let id          : String
    weak var app    : Application?
    var suscription : Subscription?
    
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

class Subscription {
    
    let name        : String
    let id          : String
    let isActive    : Bool
//    var user        : User
    unowned var user: User
    
    init(subscriptionName:String, subscriptionID:String, isSubscriptionActive:Bool, subscribedUser:User) {
        self.name       = subscriptionName
        self.id         = subscriptionID
        self.isActive   = isSubscriptionActive
        self.user       = subscribedUser
        print("Subscription \(name) with an ID \(id) is being initailized")
    }
    
    deinit {
        print("Subscription \(name) with an ID \(id) is being deinitailized")
    }
}

//Case1 - without Strong Reference Cycle
//do {
//    let _ = User(userName: "kevin", userID: "kevin.r@gmail.com")
//    let _ = Application(appName: "Music", appID: "com.kevin.user")
//    let _ = Subscription(subscriptionName: "Annual", subscriptionID: "0001", isSubscriptionActive: true, subscribedUser: kevinTheUser)
//}

//Case2 - Strong Reference Cycle
do {
    print("\n\n")
    let kevinTheUser         = User(userName: "kevin", userID: "kevin.r@gmail.com")
    let musicApplication     = Application(appName: "Music", appID: "com.kevin.user")
    let musicAppSubscription = Subscription(subscriptionName: "Annual", subscriptionID: "0001", isSubscriptionActive: true, subscribedUser: kevinTheUser)
    
    kevinTheUser.app         = musicApplication
    kevinTheUser.suscription = musicAppSubscription
    
    musicApplication.user     = kevinTheUser
    musicAppSubscription.user = kevinTheUser
}

//User kevin with an ID kevin.r@gmail.com is being initailized
//App Music with an ID com.kevin.user is being initailized
//Subscription Annual with an ID 0001 is being initailized

//App Music with an ID com.kevin.user is being deinitailized


/**** case3 - Break the Strong Reference Cycle by comment the code @ Line #46 and uncomment the code @ Line #47  ****/
//User kevin with an ID kevin.r@gmail.com is being initailized
//App Music with an ID com.kevin.user is being initailized
//Subscription Annual with an ID 0001 is being initailized
//App Music with an ID com.kevin.user is being deinitailized    
//User kevin with an ID kevin.r@gmail.com is being deinitailized
//Subscription Annual with an ID 0001 is being deinitailized


//: [Next](@next)
