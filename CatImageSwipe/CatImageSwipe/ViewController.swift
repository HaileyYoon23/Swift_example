//
//  ViewController.swift
//  CatImageSwipe
//
//  Created by 나윤서 on 2021/01/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnPrev: UIButton!
    @IBOutlet var btnNext: UIButton!
    
    var numImage :Int = 1
    var count = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let imageName = "IMG_\(self.numImage)" + ".jpg"
        imgView.image = UIImage(named: imageName)
    }

    @IBAction func btnPrev(_ sender: UIButton) {
        numImage = (numImage + 1) % count
        let imageName = "IMG_\(self.numImage)" + ".jpg"
        imgView.image = UIImage(named: imageName)
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        numImage = (numImage - 1 + 5) % count
        let imageName = "IMG_\(self.numImage)" + ".jpg"
        imgView.image = UIImage(named: imageName)
    }
    
}

