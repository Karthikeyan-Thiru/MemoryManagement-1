import Cocoa

var str = "Hello, playground"




class User {
    let name: String
    let id  : String
    var app : Application?
    
    init(userName: String, userID: String) {
        self.name   = userName
        self.id     = userID
        print("User \(name) with an ID \(id) is being initialized")
    }
    
    deinit {
        print("User \(name) with an ID \(id) is being deinitialized\n")
    }
}


//var user1 : User?
//var user2 : User?
//var user3 : User?
//user1 = User(userName: "kevin", userID: "kevin.r@gmail.com")
//User kevin with an ID kevin.r@gmail.com is being initialized

//user2 = user1
//user3 = user1
//
//user3 = nil
//user2 = nil
//user1 = nil
//User kevin with an ID kevin.r@gmail.com is being deinitialized

class Application {
    let name: String
    let id  : String
    weak var user: User?
    
    init(appName: String, appID: String) {
        self.name   = appName
        self.id     = appID
        print("App \(name) with an ID \(id) is being initialized")
    }
    
    deinit {
        print("App \(name) with an ID \(id) is being deinitialized")
    }
}


do {
    let kevinTheUser     = User(userName: "kevin", userID: "kevin.r@gmail.com")
    let musicApplication = Application(appName: "Music", appID: "com.kevin.music")
    
    kevinTheUser.app      = musicApplication
    musicApplication.user = kevinTheUser
}



