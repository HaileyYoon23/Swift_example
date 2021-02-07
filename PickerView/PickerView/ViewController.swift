//
//  ViewController.swift
//  PickerView
//
//  Created by 나윤서 on 2021/02/03.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let PICKER_VIEW_COLUMN = 2
    var imageFileName = ["IMG_1541.jpg", "IMG_1542.jpg", "IMG_1543.jpg"]
    var imageArray = [UIImage]()
    let emptyImage = UIImage()
    let minNum = 1541
    let maxNum = 1570
    let MAX_ARRAY_NUM = 1570 - 1541 + 1
    let PICKER_VIEW_WIDTH: CGFloat = 100
    let PICKER_VIEW_HEIGHT: CGFloat = 100
    
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var descript: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0..<MAX_ARRAY_NUM {
            let image = UIImage(named: self.pickImageName(i))
            imageArray.append(image ?? emptyImage)
        }
        
        name.text = self.pickImageName(0)
        imageView.image = imageArray[0]
    }
    
//    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//        return PICKER_VIEW_WIDTH
//    }
//    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
//        return PICKER_VIEW_HEIGHT
//    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1//MAX_ARRAY_NUM//imageFileName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickImageName(row)//imageFileName[row]
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)

        return imageView
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        name.text = self.pickImageName(row)
        imageView.image = imageArray[row]
    }

    func pickImageName(_ index: Int) -> String {
        let imageNum = self.minNum + (index % MAX_ARRAY_NUM)
        return "IMG_\(imageNum).jpg"
    }
}

