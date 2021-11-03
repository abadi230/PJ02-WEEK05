//
//  TransactionVC.swift
//  Bank Account Manager UI
//
//  Created by Abdullah Bajaman on 04/11/2021.
//

import UIKit

class TransactionVC: UIViewController {

    var amount: Double = 0
    var detail: String = ""
    var date : String = ""
    
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        amountLbl.text = String(amount)
        descriptionLbl.text = detail
        dateLbl.text = date
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
