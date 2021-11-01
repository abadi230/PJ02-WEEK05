import UIKit

class BankStore {
    var users: [Customer] = []
//    var accounts: [Account] = []
    func addCustomer(newCustomer: Customer){
        users.append(newCustomer)
    }
    func findCustomer(userName:String, password: String) -> Customer{
        let customer =  self.users.filter{
            $0.userName == userName && $0.password == password
       }
        return customer[0]
    }
}
class Customer {
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
    
    
    func addAccount(){}
    func removeAccount(){}
    
}
// test Bank
var custumars = [
    Customer(fullName: "Abdullah B", userName: "Abadi", password: "123456"),
    Customer(fullName: "Alaa", userName: "lwolla", password: "654321"),
    Customer(fullName: "Basel", userName: "bsool", password: "basel123")
]
//let customer =  custumars.filter{
//    $0.userName == "bsool" && $0.password == "basel123"
//}
//print(customer[0].fullName)

var bank = BankStore()
bank.addCustomer(newCustomer: custumars[0])
bank.addCustomer(newCustomer: custumars[1])
bank.addCustomer(newCustomer: custumars[2])

let cus = bank.findCustomer(userName: "bsool", password: "basel123")
print(cus.fullName)

struct Account {
    var type: String, balance: String
}








