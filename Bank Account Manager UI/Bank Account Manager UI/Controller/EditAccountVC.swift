//
//  EditAccountVC.swift
//  Bank Account Manager UI
//
//  Created by Abdullah Bajaman on 02/11/2021.
//

import UIKit

protocol UpdateDelegate {
    func updateName(name: String, index: Int)
}

class EditAccountVC: UIViewController {
    var name = ""
    var currentIndex = 0
    var delegate : UpdateDelegate!
    
    @IBOutlet weak var editAccountName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        editAccountName.text = name
    }
    
    @IBAction func updateBtn(_ sender: Any) {
        delegate.updateName(name: editAccountName.text!, index: currentIndex)
        navigationController?.popViewController(animated: true)
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
