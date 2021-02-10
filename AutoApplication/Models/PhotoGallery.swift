//
//  PhotoGallery.swift
//  AutoApplication
//
//  Created by Zhoomartov Erbolot on 07.02.2021.
//

import UIKit

class PhotoGallery {
    
    var images = [UIImage]()
    
    init() {
        setup()
    }
    
    private func setup() {
        for i in 0...9 {
            let image = UIImage(named: "image\(i)")!
            images.append(image)
        }
    }
    
}
