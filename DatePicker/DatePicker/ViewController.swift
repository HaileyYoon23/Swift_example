//
//  ViewController.swift
//  DatePicker
//
//  Created by 나윤서 on 2021/01/29.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    let timeselector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        // timeInterval 마다 updateTime 함수를 실행하라
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeselector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        lblPickerTime.text = "선택시간 : " + self.formatter.string(from: datePickerView.date)
        
    }
    
    // #selector() 의 인자로 사용될 메서드를 선언 시 , Obj-c와의 호환읠 위해 @obj 붙여야함
    @objc func updateTime() {
//        lblCurrentTime.text = String(count)
//        count += 1
        // 현재시간 가져오기
        let date = NSDate()
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
    }
}


