//
//  HomeVC.swift
//  Bank Account Manager UI
//
//  Created by Abdullah Bajaman on 30/10/2021.
//

import UIKit

class HomeVC: UIViewController {
    var customer : Customer!
    var name = ""
    
    @IBOutlet weak var lblWelcome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblWelcome.text = "Welcome \(customer.fullName)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
