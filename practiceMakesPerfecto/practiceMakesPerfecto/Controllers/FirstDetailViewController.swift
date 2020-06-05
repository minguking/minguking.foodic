//
//  FirstDedailViewController.swift
//  practiceMakesPerfecto
//
//  Created by Kang Mingu on 12/05/2020.
//  Copyright © 2020 Kang Mingu. All rights reserved.
//

import UIKit

class FirstDetailViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var realView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let cellWidth: CGFloat = UIScreen.main.bounds.width
    let cellHeight: CGFloat = UIScreen.main.bounds.height * 0.3
    
    let cell2Width: CGFloat = (UIScreen.main.bounds.width - 20 * 3) / 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        detailTitleLabel.text = Sharing.shared.firstDetailTitleEng
        
        collectionView.showsVerticalScrollIndicator = true
        collectionView.isPagingEnabled = true
        collectionView.clipsToBounds = true
        
        collectionView2.register(UINib(nibName: "FirstCollectionViewCell2", bundle: nil), forCellWithReuseIdentifier: "Cell2")
        
        descriptionLabel.text = Sharing.shared.recipeDetailEng
        
    }
    
}

extension FirstDetailViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.collectionView2 {
            return 12
        }
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionView2 {
            let cell2 = collectionView2.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as! FirstCollectionViewCell2
            
            cell2.backgroundColor = .lightGray
            cell2.label.text = "cell2"
            cell2.layer.cornerRadius = (collectionView2.frame.width - 20 * 4) / 3 / 4
            
            cell2.frame.size = CGSize(width: (collectionView2.frame.width - 20 * 4) / 3, height: (collectionView2.frame.width - 20 * 4) / 3)
            
            return cell2
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FirstDetailCollectionViewCell
        
        cell.detailImage.frame.size = CGSize(width: cell.frame.width, height: cell.frame.height)
        cell.detailImage.contentMode = .scaleAspectFit
        
        cell.detailImage.image = UIImage(named: "2")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if collectionView == collectionView2 {
            return CGSize(width: (collectionView2.frame.width - 20 * 4) / 3, height: (collectionView2.frame.width - 20 * 4) / 3)
        }
        return CGSize(width: cellWidth, height: self.collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == collectionView2 {
            return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        }
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        pageController.currentPage = Int(x / view.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == collectionView2 {
            return 20
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == collectionView2 {
            performSegue(withIdentifier: "ToFood", sender: self)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (_) in
            
            let indexPath = IndexPath(item: self.pageController.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }, completion: nil)
    }
    
}
