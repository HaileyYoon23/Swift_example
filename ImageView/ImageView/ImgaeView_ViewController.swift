//
//  ViewController.swift
//  ImageView
//
//  Created by 나윤서 on 2021/01/29.
//

import UIKit

class ImageView_ViewController: UIViewController {
    var isZoom = false
    var imgOn: UIImage?
    var imgOff: UIImage?
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn
    }
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale: CGFloat = 1.4
        var newWidth: CGFloat
        var newHeight: CGFloat
        
        if(isZoom) {
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            btnButton.setTitle("확대", for: .normal)
        } else {
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            btnButton.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgView.image = imgOn
        } else {
            imgView.image = imgOff
        }
    }
    

}

