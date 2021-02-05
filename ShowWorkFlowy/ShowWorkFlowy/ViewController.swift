//
//  ViewController.swift
//  ShowWorkFlowy
//
//  Created by 나윤서 on 2021/02/05.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var mainWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadHtml()
    }
    func loadHtml() {
        let loadPath = Bundle.main.path(forResource: "HTMLFILE", ofType: "html")
        let url = URL(fileURLWithPath: loadPath ?? "https://naver.com")
        let urlRequest = URLRequest(url: url)
        mainWebView.load(urlRequest)
    }

    @IBAction func btnRefresh(_ sender: UIBarButtonItem) {
        mainWebView.reload()
    }
    @IBAction func btnGoBackward(_ sender: UIBarButtonItem) {
        mainWebView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        mainWebView.goForward()
    }
}

