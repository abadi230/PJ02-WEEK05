//
//  Pay&Transfer.swift
//  Bank Account Manager UI
//
//  Created by Abdullah Bajaman on 02/11/2021.
//

import UIKit


class PayAndTransferVC: UIViewController {

    var customer : Customer!
   
    
    @IBOutlet weak var balanceLbl: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        balanceLbl.text = "SAR \(customer.getTotalAmounts())"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        balanceLbl.text = "SAR \(customer.getTotalAmounts())"
       
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dipositID" {
            let depositVC = segue.destination as! AddMoneyVC
            depositVC.customer = customer
        }
    }
}
