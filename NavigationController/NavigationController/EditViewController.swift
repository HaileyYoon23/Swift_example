//
//  EditViewController.swift
//  NavigationController
//
//  Created by 나윤서 on 2021/02/06.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func ifSwitchButton(_ controller: EditViewController, isSwitched: Bool)
}


class EditViewController: UIViewController {
    var textSegMessage: String = ""
    var textWayValue: String = ""
    
    var delegate: EditDelegate?
    var isOn = false
    
    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var swIsOn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txtMessage.text = textSegMessage
        swIsOn.isOn = isOn
    }
    
    @IBAction func btnEditComplete(_ sender: UIButton) {
        if let d = delegate {
            d.didMessageEditDone(self, message: txtMessage.text ?? "")
            d.ifSwitchButton(self, isSwitched: swIsOn.isOn)
        }
        
        _ = navigationController?.popViewController(animated: true)     // ViewController는 Stack 형식으로 진행되는 개념. pop을 하게 되면 현재 창을 Stack에서 꺼내 바로 이전창으로 이동. (특정 ViewContoller를 정해줘서 해당 View 까지 pop 하는 함수도 별도 존재)
    }
    @IBAction func swImageChange(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
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
