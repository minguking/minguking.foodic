//
//  FIrstCollectionViewCell.swift
//  practiceMakesPerfecto
//
//  Created by Kang Mingu on 12/05/2020.
//  Copyright © 2020 Kang Mingu. All rights reserved.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let first = [First]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
