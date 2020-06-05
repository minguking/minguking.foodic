//
//  SecondViewController.swift
//  practiceMakesPerfecto
//
//  Created by Kang Mingu on 11/05/2020.
//  Copyright © 2020 Kang Mingu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let cellWidth: CGFloat = (UIScreen.main.bounds.width - (20 * 4)) / 3
    let cellIdentifier = "Cell"
    var second: [Second] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "SecondCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        let decoder = JSONDecoder()
        guard let asset = NSDataAsset(name: "second") else { return }
        
        do {
            second = try decoder.decode([Second].self, from: asset.data)
        } catch {
            print("failed decoding.")
        }
        collectionView.reloadData()
    }

}

extension SecondViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return second.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let secondScreen = second[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! SecondCollectionViewCell
        
        cell.layer.cornerRadius = cellWidth / 5
        cell.cellView.backgroundColor = .systemPink
        
        cell.titleLabel.text = secondScreen.english
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selected = second[indexPath.row]
        Sharing.shared.secondDetailTitleEng = selected.english
        Sharing.shared.secondDetailTitleKor = selected.korean
        
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    
    
}
