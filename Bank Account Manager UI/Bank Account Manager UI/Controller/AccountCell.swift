//
//  AccountCell.swift
//  Bank Account Manager UI
//
//  Created by Abdullah Bajaman on 01/11/2021.
//

import UIKit

class AccountCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    
    @IBOutlet weak var balanceLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
