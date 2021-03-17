//
//  CategoryCell.swift
//  MantraAssignment
//
//  Created by ATLOGYS on 17/03/21.
//

import UIKit

class CategoryCell: UITableViewCell {

    //MARK:- Outlets
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var accessoryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
