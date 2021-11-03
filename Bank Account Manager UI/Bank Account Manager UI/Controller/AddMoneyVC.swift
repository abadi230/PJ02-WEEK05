//
//  AddMoneyVC.swift
//  Bank Account Manager UI
//
//  Created by Abdullah Bajaman on 03/11/2021.
//

import UIKit

class AddMoneyVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var customer : Customer!
    var selectedAccountId: String?
    
    @IBOutlet weak var txtFieldAmount: UITextField!
    @IBOutlet weak var txtFieldFrom: UITextField!
    
    
    @IBOutlet weak var balanceLbl: UILabel!
    
    @IBOutlet weak var accountTableView: UITableView!
    
    @IBOutlet weak var toastLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        balanceLbl.text = "SAR \(customer.getTotalAmounts())"
        
        accountTableView.delegate = self
        accountTableView.dataSource = self
//        accountTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customer.accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepositCellID") as! DepositCell
        
        let account = customer.accounts[indexPath.row]
        
        cell.nameLbl.text = account.name
        cell.idLbl.text = account.id
        cell.balanceLbl.text = String(account.balance)
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedAccountId = customer.accounts[indexPath.row].id
    }

    
    @IBAction func btnPay(_ sender: UIButton) {
        if accountTableView.indexPathForSelectedRow?.row == nil || txtFieldAmount.text == "" {
            toastLbl.text = " Enter amount and Select account"
            toast(message: toastLbl)
        }else {
            
            let account = customer.findAccount(id: selectedAccountId!)
            let transation = Transaction(amount: Double(txtFieldAmount.text!)!, to: txtFieldFrom.text!, date: Date())
            account.deposit(transaction: transation)
            accountTableView.reloadData()
            txtFieldAmount.text = ""
            txtFieldFrom.text = ""
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    func toast(message: UILabel){
        // "frame" x="20" y="86" width="374" height="21"
        message.textColor = .red
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            message.alpha = 0.0
        }, completion: {(isCompleted) in
            message.isHidden = true
        })
    }
    
    

}

class DepositCell : UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    
    @IBOutlet weak var balanceLbl: UILabel!
    
}
