//
//  SubCategoryCell.swift
//  MantraAssignment
//
//  Created by ATLOGYS on 17/03/21.
//

import UIKit

class SubCategoryCell: UITableViewCell {

    //MARK:- Outlets
    @IBOutlet weak var lblSubCategory: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
