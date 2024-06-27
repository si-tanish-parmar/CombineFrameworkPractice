//
//  ProductsTblCell.swift
//  CombineFrameworkPractice
//
//  Created by Tanish Parmar on 27/06/24.
//

import UIKit

class ProductsTblCell: UITableViewCell {

   
    @IBOutlet weak var productNumber: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
