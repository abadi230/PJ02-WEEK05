//
//  Bank.swift
//  Bank Account Manager UI
//
//  Created by Abdullah Bajaman on 30/10/2021.
//

import Foundation
class Bank {
//    var all : [Any] = []
    var users: [Customer] = []
    var accounts: [Account] = []
//    init (){
//        all.append(self)
//    }
    func addCustomer(newCustomer: Customer){
        users.append(newCustomer)
    }
    
    func findCustomer(userName:String, password: String) -> String{
        
        if !self.users.isEmpty{
            let customer =  self.users.filter{
                $0.userName == userName && $0.password == password
            }
            return customer[0].id
        }
        
        return "UserName or Password not valid"
    }
    
    
    func addAccount(newAccount: Account){
        self.accounts.append(newAccount)
    }
}
class Customer : Bank{
    var id : String
    var fullName : String
    var userName : String
    var password : String
//    var accounts : [Account] = []
    
    init(fullName: String, userName: String, password: String){
        self.id = UUID().uuidString
        self.fullName = fullName
        self.userName = userName
        self.password = password
    }
    
    func setPasswordAndUserName(password: String, userName: String) {
        if isValidPassword(password: password) && isValidUserName(userName: userName){
            
            self.password = password
            self.userName = userName
            
//            return "Password is Accepted"
            
        } else {
//            return "Password Not Accepted. Password must be more than 6 characters, with at least one capital, numeric or special character "}
    }
    }
     func isValidPassword(password: String) -> Bool{
        // regex : Password must be more than 6 characters, with at least one capital, numeric or special character
        let passwordRegEx = "(?:(?:(?=.*?[0-9])(?=.*?[-!@#$%&*ˆ+=_])|(?:(?=.*?[0-9])|(?=.*?[A-Z])|(?=.*?[-!@#$%&*ˆ+=_])))|(?=.*?[a-z])(?=.*?[0-9])(?=.*?[-!@#$%&*ˆ+=_]))[A-Za-z0-9-!@#$%&*ˆ+=_]{6,15}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: password)
    }
    
     func isValidUserName(userName: String) -> Bool{
        var result = true
        for user in super.users {
            if user.userName == userName{
                result = false
            }
        }
        return result
    }
    
     func checkUserNameAndPassword(userName: String, password: String) -> Bool{
        return self.password == password && self.userName == userName
    }
    
    func addAccount(){}
    func removeAccount(){}
    
}

enum AccountType { case normal, VIP }
    
class Account {
    var id : String
    var type : AccountType = .normal
    var balance : Double
    var transactions : [Transaction] = []
    
    init(balance: Double) {
        self.id = UUID().uuidString
        self.balance = balance
    }
    
}

struct Transaction {
    var amount : Double
    var date : Date
}
