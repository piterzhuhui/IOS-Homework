//
//  ViewController.swift
//  homework_13_2
//
//  Created by student on 2018/12/12.
//  Copyright © 2018年 2016110457. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController ,WKNavigationDelegate,WKUIDelegate{

    
    @IBOutlet weak var ZHUrl: UITextField!
    @IBOutlet weak var ZhwebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let url = URL(string: "http://www.163.com"){
            ZhwebView.load(URLRequest(url: url))
            ZhwebView.navigationDelegate = self
            ZhwebView.uiDelegate = self
        }
    }
    
    @IBAction func GO(_ sender: Any) {
        if let url = URL(string: ZHUrl.text ?? ""){
            ZhwebView.load(URLRequest(url: url))
        }
    }
    @IBAction func BACK(_ sender: Any) {
        ZhwebView.goBack()
    }
    @IBAction func FORWARD(_ sender: Any) {
        ZhwebView.goForward()
    }
    @IBAction func RELOAD(_ sender: Any) {
        ZhwebView.reload()
    }
    @IBAction func Local(_ sender: Any) {
        if let url = Bundle.main.url(forResource: "default", withExtension: "html") {
            //            webView.load(URLRequest(url: url))
            ZhwebView.loadFileURL(url, allowingReadAccessTo: url)
        }
    }
}

