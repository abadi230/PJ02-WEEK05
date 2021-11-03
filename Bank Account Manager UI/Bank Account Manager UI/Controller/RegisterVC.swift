//
//  RegisterVC.swift
//  Bank Account Manager UI
//
//  Created by Abdullah Bajaman on 31/10/2021.
//

import UIKit

protocol RegisterDelegate {
    func RegisterUser(userName: String, password: String)
}
protocol CostomerProfile { //
    func profile(customer: Customer, customerId: String)
}

class RegisterVC: UIViewController {
    
    var bank : Bank!
    var delegate: RegisterDelegate!
//    var userDelegate: CostomerProfile!
    
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var message: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onRegisterBtn(_ sender: Any) {
        
        
        let newCustomer = Customer (
            fullName: fullName.text!,
            userName: userName.text!,
            password: confirmPassword.text!
        )
        
        if bank.isValidPassword(password: confirmPassword.text!) && bank.isValidUserName(userName: userName.text!){
            
            bank.setPasswordAndUserName(user: newCustomer, password: confirmPassword.text!, userName: userName.text!)
            bank.createCustomer(newCustomer: newCustomer)
            
            
            
            message.text = "Password Accepted ✅"
            message.textColor = .green
            toast(message: message)
        } else {
            message.text = "Password Not Accepted ❌"
            message.textColor = .red
            toast(message: message)
        }
        
        // set function in protocol to collect data
        delegate.RegisterUser(userName: userName.text!, password: confirmPassword.text!)
        
        // store data in userDelegate
//        print(newCustomer.fullName)
//        userDelegate.profile(customer: newCustomer , customerId: newCustomer.id)
        
        
    }
    
    
    
    func toast(message: UILabel){
        
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            message.alpha = 0.0
        }, completion: {(isCompleted) in
            message.isHidden = true
        })
    }
    
}
