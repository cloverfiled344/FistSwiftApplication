//
//  FullScreenViewController.swift
//  AutoApplication
//
//  Created by Zhoomartov Erbolot on 08.02.2021.
//

import UIKit

class FullScreenViewController: UIViewController {
    
    // Mark: - Oultets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Mark: - Values
    let countCells = 1
    var photoGallery: PhotoGallery!
    var indexPath: IndexPath!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
     
        self.collectionView.register(UINib(nibName: "FullScreenViewCell", bundle: nil), forCellWithReuseIdentifier: "FullScreenViewCell")
        
        self.collectionView.performBatchUpdates(nil) { (result) in
            self.collectionView.scrollToItem(at: self.indexPath, at: .centeredHorizontally, animated: false)
        }

        
    }
}

extension FullScreenViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGallery.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FullScreenViewCell", for: indexPath) as! FullScreenViewCell
        cell.photoView.image = photoGallery.images[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameVC = collectionView.frame
        
        let widthCell = frameVC.width / CGFloat(countCells)
        let heighCell = widthCell
        
        return CGSize(width: widthCell, height: heighCell)
        
    }
}
