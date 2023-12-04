//
//  TutorialTableCell.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 04.12.2023.
//

import UIKit

class LeadersTableCell: UITableViewCell {
    
    @IBOutlet weak var userLbl: UILabel!
    @IBOutlet weak var coinsLbl: UILabel!
    @IBOutlet weak var coinImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
