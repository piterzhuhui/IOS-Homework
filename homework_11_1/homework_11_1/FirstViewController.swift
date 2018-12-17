//
//  ViewController.swift
//  homework_11_1
//
//  Created by student on 2018/12/8.
//  Copyright © 2018年 zh. All rights reserved.
//

import UIKit



class FirstViewController: UIViewController{
    
    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var No: UITextField!
    
    
    
//    var name = ""
//    var no = ""
    var stu = Student()
    
    override func viewWillAppear(_ animated: Bool) {
        No.text = stu.no
        Name.text = stu.name
    }
    
    
    @IBAction func showSecondVC(_ sender: Any) {
        stu.no = No.text!
        stu.name = Name.text!
        
        let secVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as!SecondViewController
        secVC.stu = stu
       
        self.navigationController?.pushViewController(secVC, animated: true)
    }
    
    @IBAction func showThirdVC(_ sender: Any) {
        let thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirldVC")
        present(thirdVC,animated: true,completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

