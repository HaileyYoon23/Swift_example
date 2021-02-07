//
//  AddViewController.swift
//  TableViewController
//
//  Created by 나윤서 on 2021/02/06.
//

import UIKit

protocol Add {
    func AddData(_ controller: AddViewController, textAddItem: String, imgToAdd: String)
}


class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let imageNameList = ["cart.png", "clock.png", "pencil.png"]
    var imageList: [UIImage?] = []
    var proto: Add?
    var imgToInsert: String = ""
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var tfAddItem: UITextField!
    @IBOutlet var pvPicker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0..<imageNameList.count {
            imageList.append(UIImage(named: imageNameList[i]))
        }
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        if let p = proto {
            p.AddData(self, textAddItem: tfAddItem.text ?? "", imgToAdd: imgToInsert)
            tfAddItem.text = ""
        }
        _ = navigationController?.popViewController(animated: true)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageNameList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageList[row])
        imageView.frame = CGRect(x: 200, y: 200, width: 200, height: 200)
        return imageView
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imgView.image = imageList[row]
        imgToInsert = imageNameList[row]
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
