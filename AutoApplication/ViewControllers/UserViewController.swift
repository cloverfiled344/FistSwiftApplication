//
//  UserViewController.swift
//  AutoApplication
//
//  Created by Zhoomartov Erbolot on 09.02.2021.
//

import UIKit

class UserViewController: UIViewController {

    // Mark: - Outlets
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userCityLabel: UILabel!
    
    
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userImageView.image = user.image
        userNameLabel.text = user.name
        userCityLabel.text = user.city
        
        userImageView.layer.borderWidth = 3.0
        
        
        if user.gender == .male {
            userImageView.layer.borderColor = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
        }
        else {
            userImageView.layer.borderColor = #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)
        }
    }
    


}
