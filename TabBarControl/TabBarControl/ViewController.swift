//
//  ViewController.swift
//  TabBarControl
//
//  Created by 나윤서 on 2021/02/06.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnGoToImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    @IBAction func btnGoToDatePicker(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
}

