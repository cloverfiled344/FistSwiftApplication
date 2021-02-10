//
//  ProfileViewController.swift
//  AutoApplication
//
//  Created by Zhoomartov Erbolot on 07.02.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    // Mark: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var avatarName: UILabel!
    @IBOutlet weak var avatarAddress: UILabel!
    
    // Mark: - Constants
    let countCells = 3
    let offset: CGFloat = 2.0
    
    
    // Mark: - Values
    let photoGallery = PhotoGallery()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.avatarImage.layer.borderWidth = 3.0
        self.avatarImage.layer.borderColor = UIColor.lightGray.cgColor
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nameKey = "nameKey"
        let cityKey = "cityKey"
        if let name = UserDefaults.standard.string(forKey: nameKey), let city = UserDefaults.standard.string(forKey: cityKey) {
            avatarName.text = name
            avatarAddress.text = city
        }
        
    }

}

extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGallery.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        cell.photoView.image = photoGallery.images[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame
        
        let widthCell = frameCV.width / CGFloat(countCells)
        let heighCell = widthCell
        
        let spacing = CGFloat((countCells + 1)) * offset / CGFloat(countCells)
        
        return CGSize(width: widthCell - spacing, height: heighCell - (offset * 2))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FullScreenViewController") as! FullScreenViewController
        vc.photoGallery = photoGallery
        vc.indexPath = indexPath
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
