//
//  ViewController.swift
//  homework_10_2
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
    }


//
    @IBAction func btnClicked(_ sender: Any) {
        let imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        imageView.image = UIImage(named: "image")
        UIView.transition(from: myView, to: imageView, duration: 2, options: .transitionFlipFromRight, completion: nil)
//        UIView.transition(with: myView, duration: 1, options: .transitionFlipFromTop, animations:{ self.myView.backgroundColor = UIColor.green}, completion: nil)
//    }
    
    }
    
    
    @IBAction func btnClicked_color(_ sender: Any) {
        UIView.transition(with: myView, duration: 1, options: .transitionFlipFromTop, animations:{ self.myView.backgroundColor = UIColor.green}, completion: nil)
    }
}


