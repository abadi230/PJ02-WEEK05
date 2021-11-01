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
    func RegisterUser(userName: String, fullName: String) {
        print(userName, fullName)
    }
    
    
    
    
    // different between Bank() and Bank! ??
    var bank : Bank!
    var customerId = ""
    var name = ""
    var userName = ""
    var password = ""
    // declare instance of Customer
    var profile : Customer!
    
    @IBOutlet weak var textUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let registerVC = tabBarController?.viewControllers?[1] as! RegisterVC
        registerVC.delegate = self
        
        // Do any additional setup after loading the view.
    }
    @IBAction func btnLogin(_ sender: UIButton) {
        
        // check username and password
        bank.findCustomer(userName: textUserName.text!, password: txtPassword.text!)
        let custmerId = bank.findCustomer(userName: textUserName.text!, password: txtPassword.text!)
        
        // if customer not existed
        if custmerId != "UserName or Password not valid" {
            //
            profile = findCustmer(By: custmerId)
            
            performSegue(withIdentifier: "loginSegue", sender: self)
            
//            let vc = (storyboard?.instantiateViewController(withIdentifier: "HomeID")) as! HomeVC
//            vc.name = customer.fullName
//            navigationController?.popToRootViewController(animated: true)
//            navigationController?.show(vc, sender: self)
            
    //        appDelegate.window?.rootViewController = vc
//
//            let tabVC = (storyboard?.instantiateViewController(withIdentifier: "SecondTabID"))!
//            // set rootViewcontroller for tabBar
//            self.view.window?.rootViewController = tabVC
////            navigationController?.popToRootViewController(animated: true)
//            navigationController?.popToRootViewController(animated: true)
        } else {
            textUserName.backgroundColor = .red
            txtPassword.backgroundColor = .red
        }
        
    }
    func findCustmer(By id: String) -> Customer{
        return bank.users.filter{ $0.id == id}[0]
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "loginSegue") {
            let homeTabBarVC = segue.destination as! UITabBarController
            let homeNav = homeTabBarVC.viewControllers?[0] as! UINavigationController
            let homeVC = homeNav.children[0] as! HomeVC
            homeVC.customer = self.profile
        }
    }
}
