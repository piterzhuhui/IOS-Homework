//
//  SexondViewController.swift
//  homework_5
//
//  Created by student on 2018/10/27.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class SexondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Second"
        view.backgroundColor = UIColor.gray
        
        let lable = UILabel(frame: CGRect(x: 200, y: 80, width: 300, height: 150))
        lable.text = "fgdghdgf 😊"
        lable.textAlignment = .center
        lable.backgroundColor = UIColor.blue
        lable.textColor = UIColor.white
        lable.center = view.center
        view.addSubview(lable)
        
//        let shape1 = myView
        
        
        // Do any additional setup after loading the view.
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
