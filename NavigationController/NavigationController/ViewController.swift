//
//  ViewController.swift
//  NavigationController
//
//  Created by 나윤서 on 2021/02/06.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    let imgJungA = UIImage(named: "IMG_0017.jpg")
    let imgSeolA = UIImage(named: "IMG_0948.heic")
    
    var isOn: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = UIImage()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {     // 현재 view 에서 'seque'로 전환되기 전에 호출되는 함수
        let editViewController = segue.destination as? EditViewController
        if segue.identifier == "editButton" {
            editViewController?.textWayValue = "segue : use Button"
        } else if segue.identifier == "editBarButton" {
            editViewController?.textWayValue = "segue : use Bar Button"
        }
        editViewController?.textSegMessage = txtMessage.text ?? ""
        editViewController?.delegate = self
        editViewController?.isOn = isOn
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txtMessage.text = message
    }
    
    func ifSwitchButton(_ controller: EditViewController, isSwitched: Bool) {
        if isSwitched {
            imgView.image = imgJungA
        } else {
            imgView.image = imgSeolA
        }
        isOn = isSwitched
    }

}

