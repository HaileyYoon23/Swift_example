//
//  ViewController.swift
//  PageControl
//
//  Created by 나윤서 on 2021/02/05.
//

import UIKit

class ViewController: UIViewController {
    let numberOfImage: Int = 6
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    func callImageName(index: Int) -> String {
        let imageIndex: Int = 15 + (index) % numberOfImage
        return "IMG_00\(imageIndex).jpg"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = numberOfImage
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.darkGray
        
        imgView.image = UIImage(named: callImageName(index: 0))
    }
    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: callImageName(index: pageControl.currentPage))
    }
    

}

