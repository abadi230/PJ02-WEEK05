//
//  TransferVC.swift
//  Bank Account Manager UI
//
//  Created by Abdullah Bajaman on 03/11/2021.
//

import UIKit

class TransferVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    var customer: Customer!
    var selectedAccountId : String = ""
    
    
    @IBOutlet weak var txtBox: UITextField!
    @IBOutlet weak var dropDown: UIPickerView!
    @IBOutlet weak var toTxtField: UITextField!
    @IBOutlet weak var amountTxtField: UITextField!
    
    @IBOutlet weak var toastLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return customer.accounts.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return customer.accounts[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let account = customer.accounts[row]
        self.txtBox.text = account.name
        self.dropDown.isHidden = true
        
        selectedAccountId = account.id
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.txtBox {
            self.dropDown.isHidden = false
            textField.endEditing(true)
        }
    }
    
    
    @IBAction func sendBtn(_ sender: UIButton) {
        let (to, amount) = (toTxtField.text!, amountTxtField.text!)
        if to != "" && amount != "" {
            let account = customer.findAccount(id: selectedAccountId)
            if account.checkPalance(amount: Double(amount)!){
                
                let transaction = Transaction(amount: Double(amount)!, to: to, date: Date())
                
                account.withdraw(transaction: transaction)
                
                navigationController?.popViewController(animated: true)
            }else{
                toastLbl.text = "Balance is insufficient"
                toast(message: toastLbl)
            }
        }else{
            toastLbl.text = "Fill form please"
            toast(message: toastLbl)
        }
    }
    
    
    func toast(message: UILabel){
        message.textColor = .red
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            message.alpha = 0.0
        }, completion: {(isCompleted) in
            message.isHidden = true
        })
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
