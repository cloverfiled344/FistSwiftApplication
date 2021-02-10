//
//  User.swift
//  AutoApplication
//
//  Created by Zhoomartov Erbolot on 09.02.2021.
//

import UIKit


enum Gender {
    case male
    case female
}


class User: NSObject {
    var name: String
    var city: String
    var image: UIImage
    var gender: Gender
    
    
    init(name: String, city: String, image: UIImage, gender: Gender) {
        self.name = name
        self.city = city
        self.image = image
        self.gender = gender
    }
    
}
