//
//  FirstViewController.swift
//  practiceMakesPerfecto
//
//  Created by Kang Mingu on 11/05/2020.
//  Copyright © 2020 Kang Mingu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let cellWidth: CGFloat = (UIScreen.main.bounds.width - (20 * 4)) / 3
    let cellIdentifier = "Cell"
    var first: [First] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Foodic"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "FirstCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        let decoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "first") else { return }
        
        do {
            first = try decoder.decode([First].self, from: dataAsset.data)
        } catch {
            print("failed decoding JSON")
        }
        collectionView.reloadData()
    }
}


extension FirstViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return first.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let firstScreen = first[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! FirstCollectionViewCell
        
        cell.layer.cornerRadius = cellWidth / 5
        
        cell.view.backgroundColor = .systemRed
        cell.titleLabel.text = firstScreen.english
        cell.imageView.contentMode = .scaleToFill
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedKind = first[indexPath.row]
        
        Sharing.shared.firstDetailTitleEng = selectedKind.english
        Sharing.shared.firstDetailTitleKor = selectedKind.korean
        
        performSegue(withIdentifier: "segue", sender: self)
    }
    
}


