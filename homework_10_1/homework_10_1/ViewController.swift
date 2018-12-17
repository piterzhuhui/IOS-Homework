//
//  ViewController.swift
//  homework_10_1
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 zhuhui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    
    var timer:Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {[weak weakSelf = self](myView)  in weakSelf?.myView.center.x += 20})
        
    }

    @IBAction func btnClicked(_ sender: Any) {
        timer?.invalidate()
        UIView.animate(withDuration: 2, delay: 1, options: [.curveEaseInOut,.autoreverse,.repeat], animations: {
                self.myView.alpha = 0
//              改变视图位置
                self.myView.center.x = self.view.bounds.width
//              改变视图大小
                self.myView.bounds = CGRect(x: 0, y: 0, width: 20, height: 20)
//              改变视图的transform
                self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                self.myView.transform = CGAffineTransform.identity
                self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                self.myView.transform = CGAffineTransform.identity
                self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                self.myView.transform = CGAffineTransform.identity
                self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                self.myView.transform = CGAffineTransform.identity
                self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                self.myView.transform = CGAffineTransform.identity
            
            
//              改变视图颜色
               self.myView.backgroundColor = UIColor.green
        }) {(finished) in
                if finished{
                    self.myView.removeFromSuperview()
                }
            }
    }
    
}

