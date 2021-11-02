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
    //    var accounts: [Account] = [] // move it to Customer
    //    init (){
    //        all.append(self)
    //    }
    func createCustomer(newCustomer: Customer){
        users.append(newCustomer)
    }
    
        func findCustmer(By id: String) -> Customer{
            return self.users.filter{ $0.id == id}[0]
        }
    func check(userName: String, password: String) -> Bool {
        var result = false
        for user in users {
            if user.userName == userName && user.password == password{
                result = true
            }
        }
        return result
    }
    func findCustomer(userName:String, password: String) -> String?{ // inhance
        
        if !self.users.isEmpty{
            let customer =  self.users.filter{
                $0.userName == userName && $0.password == password
            }
            return customer[0].id
//            print("\(customer[0].id)")
        }
        
        return "UserName or Password not valid"
//        print("UserName or Password not valid")
    }
   
    func setPasswordAndUserName(user: Customer, password: String, userName: String) {
        if isValidPassword(password: password) && isValidUserName(userName: userName){
            
            user.password = password
            user.userName = userName
            
            print("Password is Accepted")
            
        } else {
            print("Password Not Accepted. Password must be more than 6 characters, with at least one capital, numeric or special character ")
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
        for user in self.users {
            if user.userName == userName{
                result = false
            }
        }
        return result
    }
    
    func checkUserNameAndPassword(user: Customer, userName: String, password: String) -> Bool{
        return user.password == password && user.userName == userName
    }
    
}
class Customer {
    
    var id : String
    var fullName : String
    var userName : String
    var password : String
    var accounts : [Account] = []
    
    
    init(fullName: String, userName: String, password: String){
        self.id = UUID().uuidString
        self.fullName = fullName
        self.userName = userName
        self.password = password
    }
    
    //    func setPasswordAndUserName(password: String, userName: String) {
    //        if isValidPassword(password: password) && isValidUserName(userName: userName){
    //
    //            self.password = password
    //            self.userName = userName
    //
    ////            return "Password is Accepted"
    //
    //        } else {
    ////            return "Password Not Accepted. Password must be more than 6 characters, with at least one capital, numeric or special character "}
    //    }
    //    }
    //     func isValidPassword(password: String) -> Bool{
    //        // regex : Password must be more than 6 characters, with at least one capital, numeric or special character
    //        let passwordRegEx = "(?:(?:(?=.*?[0-9])(?=.*?[-!@#$%&*ˆ+=_])|(?:(?=.*?[0-9])|(?=.*?[A-Z])|(?=.*?[-!@#$%&*ˆ+=_])))|(?=.*?[a-z])(?=.*?[0-9])(?=.*?[-!@#$%&*ˆ+=_]))[A-Za-z0-9-!@#$%&*ˆ+=_]{6,15}"
    //        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
    //        return passwordTest.evaluate(with: password)
    //    }
    //
    //     func isValidUserName(userName: String) -> Bool{
    //        var result = true
    //        for user in super.users {
    //            if user.userName == userName{
    //                result = false
    //            }
    //        }
    //        return result
    //    }
    //
    //     func checkUserNameAndPassword(userName: String, password: String) -> Bool{
    //        return self.password == password && self.userName == userName
    //    }
    
    func addAccount(newAccount: Account) -> Account{
        self.accounts.append(newAccount)
        return newAccount
    }
    
    
    func customerAccounts(customerId: String) -> [Account]{
        return self.accounts.filter{ $0.id == customerId}
    }
    
    func removeAccount(account: Account){
        if let index = accounts.firstIndex(of: account){
            accounts.remove(at: index)
        }
    }
    
    func moveAccount(from fromIndex: Int, to toIndex: Int){
        if fromIndex == toIndex { return }
        // Get reference to object being moved so you can reinsert it
        let movedAccont = accounts[fromIndex]
        
        // Remove item from array
        accounts.remove(at: fromIndex)
        // Insert item in array at new location
        accounts.insert(movedAccont, at: toIndex)
    }
    
}

enum AccountType : String  { case normal, VIP }

class Account : Equatable {
    
    var id : String
    var name : String
    var type : AccountType = .normal // class inhert from customer. should in customer
    var balance : Double
    var transactions : [Transaction] = []
    
    static func == (lhs: Account, rhs: Account) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.type == rhs.type &&
        lhs.balance == rhs.balance
    }
    init(name: String, balance: Double) {
        self.id = UUID().uuidString
        self.name = name
        self.balance = balance
    }
    
}

struct Transaction {
    var amount : Double
    var date : Date
}
