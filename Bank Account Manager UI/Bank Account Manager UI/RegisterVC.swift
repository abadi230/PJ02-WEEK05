//
//  RegisterVC.swift
//  Bank Account Manager UI
//
//  Created by Abdullah Bajaman on 31/10/2021.
//

import UIKit

protocol RegisterDelegate {
    
    func RegisterUser(userName: String, fullName: String)
    
    
}

class RegisterVC: UIViewController {

    var bank : Bank!
    var delegate: RegisterDelegate!
    
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onRegisterBtn(_ sender: Any) {
        
        if let userName = userName.text {
            delegate.RegisterUser(userName: userName, fullName: fullName.text!)
        }
    }
        
//        let newCustomer = Customer(fullName: fullName.text!, userName: userName.text!, password: confirmPassword.text!)
//        newCustomer.setPasswordAndUserName(password: confirmPassword.text!, userName: userName.text!)
//
//            bank.addCustomer(newCustomer: newCustomer)
        
        
        
//
////             send to login
//            let loginVC = storyboard?.instantiateViewController(withIdentifier: "loginID") as! LoginVC
//            loginVC.customerId = newCustomer.id
//            navigationController?.show(loginVC, sender: self)
//        }
        
        
        
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
