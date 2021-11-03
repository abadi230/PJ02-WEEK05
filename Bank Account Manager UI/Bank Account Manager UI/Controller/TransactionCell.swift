//
//  TransactionCell.swift
//  Bank Account Manager UI
//
//  Created by Abdullah Bajaman on 03/11/2021.
//

import UIKit

class TransactionCell: UITableViewCell {
    @IBOutlet weak var amountLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
