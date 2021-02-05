//
//  ViewController.swift
//  AlertMessage
//
//  Created by 나윤서 on 2021/02/03.
//

import UIKit

class ViewController: UIViewController {
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    let imgRemove = UIImage()
    var isLampOn = true
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = imgOn
    }
    @IBAction func btnTrunOn(_ sender: UIButton) {
        if isLampOn {
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            let noAction = UIAlertAction(title: "아니오, 모르겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            lampOnAlert.addAction(noAction)
            present(lampOnAlert, animated: true, completion: nil)
        } else {
            imageView.image = imgOn
            isLampOn = true
        }
        
    }
    @IBAction func btnTrunOff(_ sender: UIButton) {
        if isLampOn {
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {ACTION in self.imageView.image = self.imgOff
                self.isLampOn = false
            })
            let noAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(noAction)
            
            present(lampOffAlert, animated: true, completion: nil)
        }
        
    }
    @IBAction func btnRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: UIAlertAction.Style.default, handler: {ACTION in
            self.imageView.image = self.imgRemove
        })
        let onAction = UIAlertAction(title: "아니오, 램프를 켭니다 (on)", style: UIAlertAction.Style.default, handler: {ACTION in
            self.imageView.image = self.imgOn
            self.isLampOn = true
        })
        let offAction = UIAlertAction(title: "아니오, 램프를 끕니다 (off)", style: UIAlertAction.Style.default, handler: {ACTION in
            self.imageView.image = self.imgOff
            self.isLampOn = false
        })
        lampRemoveAlert.addAction(removeAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(offAction)
        
        present(lampRemoveAlert, animated: true, completion: nil)
    }
    
}

