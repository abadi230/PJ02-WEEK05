//
//  HomeVC.swift
//  Bank Account Manager UI
//
//  Created by Abdullah Bajaman on 30/10/2021.
//

import UIKit
/*
 customer new in protocol is = nil
 should collect customer from login or register
 */
//protocol CostomerProfile { //
//    func profile(customer: Customer, customerId: String)
//}
class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UpdateDelegate {
    func updateName(name: String, index: Int) {
        print(name)
//        customer.updateAccount(name)
        customer.accounts[index].name = name
        accountTableView.reloadData()
        
    }
    
//    var delegate : CostomerProfile!
    var bank = Bank()
    var customer : Customer!
    var name = ""
    
    @IBOutlet weak var lblWelcome: UILabel!
    
    @IBOutlet weak var accountTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblWelcome.text = "Welcome \(customer.fullName)"
       
        accountTableView.delegate = self
        accountTableView.dataSource = self
        
//        delegate.profile(customer: customer, customerId: customer.id)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customer.accounts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCellID") as! AccountCell
        
        let cellCus = customer.accounts[indexPath.row]
//        cell.nameLbl.text = customer.accounts[indexPath.row].type.rawValue
        cell.nameLbl.text = customer.accounts[indexPath.row].name
        cell.idLbl.text = cellCus.id
        cell.balanceLbl.text = String(cellCus.balance)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let account = customer.accounts[indexPath.row]
            // remove account from bank
            customer.removeAccount(account: account)
            // also remove the row from table with an animation
            accountTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        customer.moveAccount(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let EditVC = storyboard?.instantiateViewController(withIdentifier: "editID") as! EditAccountVC
        let selectedAccount = customer.accounts[indexPath.row]
        EditVC.name = selectedAccount.name
        EditVC.currentIndex = indexPath.row
        EditVC.delegate = self
        navigationController?.pushViewController(EditVC, animated: true)
        
        
    }
    

    

    @IBAction func createAccount(_ sender: UIBarButtonItem) {
        
        
        // Create a new Account and add it to customer.accounts
        let newAccount = customer.addAccount(newAccount: Account(name: "Islamic Account", balance: 50))
        // figure out where that account in the array
        if let index = customer.accounts.firstIndex(of: newAccount) {
            // insert the new row of Account inside table
            let indexPath = IndexPath(row: index, section: 0)
        
            accountTableView.insertRows(at: [indexPath], with: .automatic)
        }
        
    }
    
    @IBAction func ToggleEditingMode(_ sender: UIButton ){
        // If you are currently in editing mode...
        if isEditing {
            // Change text of button to inform user of state
            sender.setTitle("Edit", for: .normal)
            // Turn off editing mode
            setEditing(false, animated: true)
        } else {
            // Change text of button to inform user of state
            sender.setTitle("Done", for: .normal)
            // Enter editing mode
            setEditing(true, animated: true)
        }
        
    }
    
    
    @IBAction func payAndTransferBtn(_ sender: UIButton) {
        
        performSegue(withIdentifier: "transferID", sender: self)
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "transferID"{

            let paymentVC = segue.destination as! PayAndTransferVC

//            paymentVC.balance = customer.getTotalAmounts()
            paymentVC.customer = customer
            
        }
    }
    
}
