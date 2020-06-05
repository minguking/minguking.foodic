//
//  SecondDetailViewController.swift
//  practiceMakesPerfecto
//
//  Created by Kang Mingu on 12/05/2020.
//  Copyright © 2020 Kang Mingu. All rights reserved.
//

import UIKit

class SecondDetailViewController: UIViewController {
    
    let cellWidth: CGFloat = UIScreen.main.bounds.width
    
    @IBOutlet weak var realView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let cell2Width: CGFloat = (UIScreen.main.bounds.width - 20 * 3) / 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        realView.backgroundColor = Sharing.shared.backGroundColor
        navigationItem.title = Sharing.shared.secondDetailTitleEng
        collectionView.isScrollEnabled = true
        collectionView.clipsToBounds = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView2.backgroundColor = Sharing.shared.backGroundColor
        collectionView2.register(UINib(nibName: "SecondCollectionViewCell2", bundle: nil), forCellWithReuseIdentifier: "Cell2")
        
        detailTitleLabel.text = Sharing.shared.secondDetailTitleEng
        descriptionLabel.text = Sharing.shared.ingredientDetailEng
        
        pageController.numberOfPages = collectionView.numberOfItems(inSection: 0)
    }
}

extension SecondDetailViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.collectionView2 {
            return 12
        }
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionView2 {
            let cell2 = collectionView2.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as! SecondCollectionViewCell2
            
            cell2.backgroundColor = .systemPurple
            cell2.layer.cornerRadius = (collectionView2.frame.width - 20 * 4) / 3 / 4
            cell2.frame.size = CGSize(width: (collectionView2.frame.width - 20 * 4) / 3, height: (collectionView2.frame.width - 20 * 4) / 3)
            
            return cell2
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SecondDetailCollectionViewCell
        
        cell.detailImage.image = UIImage(named: "3")
        cell.detailImage.frame.size = CGSize(width: cell.frame.width, height: cell.frame.height)
        cell.detailImage.contentMode = .scaleAspectFill
        cell.detailImage.contentMode = .scaleAspectFit
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.collectionView2 {
            return CGSize(width: cell2Width, height: cell2Width)
        }
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == self.collectionView2 {
            return 20
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == self.collectionView2 {
            return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        }
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        pageController.currentPage = Int(x / view.frame.width)
    }
    
}
