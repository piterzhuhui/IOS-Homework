//
//  SecondViewController.swift
//  homework_11_1
//
//  Created by student on 2018/12/8.
//  Copyright © 2018年 zh. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
   
//    var no = ""
//    var name = ""
    var stu:Student!
    
    
    @IBOutlet weak var No: UITextField!
    @IBOutlet weak var Name: UITextField!
    
    @IBAction func back(_ sender: Any) {
        stu.no = No.text!
        stu.name = Name.text!
        
        
    navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        No.text = stu.no
        Name.text = stu.name
        
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
