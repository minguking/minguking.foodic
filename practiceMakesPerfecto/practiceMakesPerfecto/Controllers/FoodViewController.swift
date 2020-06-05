//
//  FoodViewController.swift
//  practiceMakesPerfecto
//
//  Created by Kang Mingu on 15/05/2020.
//  Copyright © 2020 Kang Mingu. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {

    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var closeButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        foodNameLabel.text = "ddddd"
        navigationItem.title = foodNameLabel.text

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closebuttonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
