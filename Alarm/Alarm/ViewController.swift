//
//  ViewController.swift
//  Alarm
//
//  Created by 나윤서 on 2021/01/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblTargetTime: UILabel!
    
    let timeselector: Selector = #selector(ViewController.updateTime)
    let timeInterval = 1.0
    var curDate: String = ""
    var tarDate: String = ""
    let commonFormat = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        commonFormat.dateFormat = "yyyy-MM-dd hh:mm"
        Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: timeselector, userInfo: nil, repeats: true)
    }
    @IBAction func setTargetTime(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd hh:mm EEE"
        lblTargetTime.text = "알람시간 : " + formatter.string(from: sender.date)
        tarDate = commonFormat.string(from: sender.date)
    }
    @objc func updateTime() {
        let date = NSDate() as Date// 현재시간으로 Update
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss EEE"
        
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
        curDate = commonFormat.string(from: date)
        
        if curDate == tarDate {
            view.backgroundColor = UIColor.red
        } else {
            view.backgroundColor = UIColor.white
        }
    }
}

