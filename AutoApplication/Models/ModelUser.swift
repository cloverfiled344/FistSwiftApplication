//
//  ModelUser.swift
//  AutoApplication
//
//  Created by Zhoomartov Erbolot on 09.02.2021.
//

import UIKit


class ModelUser {
    var users = [[User]]()
    
    
    init() {
        setup()
    }
    
    func setup() {
        let man1 = User(name: "Luffy", city: "Mexico", image: UIImage(named: "man1")!, gender: .male)
        let man2 = User(name: "Gerald", city: "Italy", image: UIImage(named: "man1")!, gender: .male)
        
        let manArray = [man1, man2]
        
        let woman1 = User(name: "Satenik", city: "Armenia", image: UIImage(named: "woman")!, gender: .female)
        let woman2 = User(name: "Anna", city: "London", image: UIImage(named: "woman")!, gender: .female)
        
        let womanArray = [woman1, woman2]
        
        users.append(manArray)
        users.append(womanArray)
    }
    
}
