//
//  TransactionsTVC.swift
//  Bank Account Manager UI
//
//  Created by Abdullah Bajaman on 31/10/2021.
//

import UIKit

class TransactionsTVC: UITableViewController {
    
    var account : Account!
    var selectedTrans : Transaction!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.register(UINib(nibName: "TransactionCell", bundle: nil), forCellReuseIdentifier: "transactionID")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return account.transactions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionID", for: indexPath)as! TransactionCell
        
        let trans = account.transactions[indexPath.row]
        
        cell.amountLbl.text = String(trans.amount)
        cell.descriptionLbl.text = trans.to
        cell.timeLbl.text = trans.date_format(date: trans.date)

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTrans = account.transactions[indexPath.row]
        performSegue(withIdentifier: "detailID", sender: self)
    }
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailID"{
            let transD = segue.destination as! TransactionVC
            transD.date = selectedTrans.date_format(date: selectedTrans.date)
            transD.detail = selectedTrans.to
            transD.amount = selectedTrans.amount
            
        }
    }
   

}
