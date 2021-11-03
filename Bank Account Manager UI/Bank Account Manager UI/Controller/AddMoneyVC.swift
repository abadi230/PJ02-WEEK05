//
//  AddMoneyVC.swift
//  Bank Account Manager UI
//
//  Created by Abdullah Bajaman on 03/11/2021.
//

import UIKit

class AddMoneyVC: UIViewController {
   
    var customer : Customer!
    
    @IBOutlet weak var txtFieldAmount: UITextField!
    @IBOutlet weak var balanceLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        balanceLbl.text = "SAR \(customer.getTotalAmounts())"
        
        
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
