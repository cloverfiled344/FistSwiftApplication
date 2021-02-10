//
//  UserTableViewCell.swift
//  AutoApplication
//
//  Created by Zhoomartov Erbolot on 09.02.2021.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!    
    @IBOutlet weak var userName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
