//
//  ViewController.swift
//  AlarmClock
//
//  Created by 나윤서 on 2021/02/03.
//

import UIKit

class ViewController: UIViewController {
    var curDate = String()
    var alramDate = String()
    let timeInterval = 1.0
    let commonFormat = DateFormatter()
    let formatter = DateFormatter()
    
    var silentAfterAlarm = 0
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblAlramTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let date = NSDate() as Date
        commonFormat.dateFormat = "yyyy-MM-dd hh:mm:ss"
        formatter.dateFormat = "yyyy-MM-dd hh:mm"
        
        lblCurrentTime.text = commonFormat.string(from: date)
        Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        if self.silentAfterAlarm > 0 {
            self.silentAfterAlarm -= 1
        }
    }

    @IBAction func datePick(_ sender: UIDatePicker) {
        lblAlramTime.text = formatter.string(from: sender.date)
        alramDate = formatter.string(from: sender.date)
        
    }
    
    @objc func updateTime() {
        let date = NSDate() as Date
        
        lblCurrentTime.text = commonFormat.string(from: date)
        curDate = formatter.string(from: date)
        if curDate == alramDate && self.silentAfterAlarm <= 0 {
            let alramAlert = UIAlertController(title: "알람", message: "알람 시간이 되었습니다.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertAction.Style.default, handler: {ACTION in
                self.silentAfterAlarm = 60
            })
            alramAlert.addAction(okAction)
            present(alramAlert, animated: true, completion: nil)
        }
    }

}

