//
//  LoginVC.swift
//  Bank Account Manager UI
//
//  Created by Abdullah Bajaman on 30/10/2021.
//

/*
 store data
 best way to pass data between classes :
 different between Bank() and Bank! ??
 */
import UIKit

class LoginVC: UIViewController, RegisterDelegate {
    func RegisterUser(userName: String, password: String) {
        textUserName.text = userName
        txtPassword.text = password
    }
    
    
    var bank : Bank!
    var customerId : String?
    var name = ""
    var userName = ""
    var password = ""
    // declare instance of Customer
    var profile : Customer!
    
    
    @IBOutlet weak var textUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var messageLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textUserName.text = userName
        txtPassword.text = password
        
        // get data from RegisterVC by delegate
        let registerVC = tabBarController?.viewControllers?[1] as! RegisterVC
        registerVC.delegate = self
        
    }
    @IBAction func btnLogin(_ sender: UIButton) {
        
        // check username and password
        if bank.check(userName: textUserName.text!, password: txtPassword.text!){
            print("true")
            let id = bank.findCustomer(userName: textUserName.text!, password: txtPassword.text!)!
            
            // if customer not existed
            if id != "UserName or Password not valid" {
                //
                profile = bank.findCustmer(By: id)
                
                performSegue(withIdentifier: "loginSegue", sender: self)
                
            }else {
                //                messageLbl.isHidden = false
                messageLbl.text = "UserName or Password not valid"
                messageLbl.textColor = .red
                toast(message: messageLbl)
            }
            
        } else {
            print(false)
            //            messageLbl.isHidden = false
            messageLbl.text = "UserName or Password not valid"
            messageLbl.textColor = .red
            toast(message: messageLbl)
            
        }
        
    }
    
    
    
    func toast(message: UILabel){
        
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            message.alpha = 0.0
        }, completion: {(isCompleted) in
            message.isHidden = true
        })
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "loginSegue") {
//
            let homeVC = segue.destination as! HomeVC
            homeVC.customer = self.profile
        }
    }
}
