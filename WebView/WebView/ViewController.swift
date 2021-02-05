//
//  ViewController.swift
//  WebView
//
//  Created by 나윤서 on 2021/02/03.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    let firstPage: String = "https://github.com/jungAcat"
    let site1Page: String = "/Coding_Probelms"
    let site2Page: String = "/Swift_example"
    let defaultUrlString: String = "https://www.naver.com"
    
    func loadWebPage(_ url: String) {       // 앱 시작시 기본 web page를 보여주는 함수
        let myUrl = URL(string: url)                                        // 1) string -> URL
        let defaultUrl: URL = URL(fileURLWithPath: defaultUrlString)
        let myRequest = URLRequest(url: myUrl ?? defaultUrl)                // 2) URL -> URLRequest
        myWebView.load(myRequest)                                           // 3) Load URLRequest to WebView
    }
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("https://www.")
        if !flag {
            strUrl = "https://www." + strUrl
        }
        return strUrl
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView.navigationDelegate = self
        loadWebPage(firstPage)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    @IBAction func btnGoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text ?? "naver.com")
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage(firstPage + site1Page)
    }
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage(firstPage + site2Page)
    }
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p><p><a href=\"" + defaultUrlString + "\">naver</a>으로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath ?? defaultUrlString)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
        
    }
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    @IBAction func btnRefresh(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
}

