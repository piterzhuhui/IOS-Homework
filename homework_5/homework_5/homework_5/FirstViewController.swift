//
//  FirstViewController.swift
//  homework_5
//
//  Created by student on 2018/10/27.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "first"
        view.backgroundColor = UIColor.red
        //创建标签
        let lable = UILabel(frame: CGRect(x: 200, y: 80, width: 300, height: 150))
        lable.text = "Hello world 😊"
        lable.textAlignment = .center
        lable.backgroundColor = UIColor.blue
        lable.textColor = UIColor.white
        lable.center = view.center
        view.addSubview(lable)
        
        //创建按钮
        let button = UIButton(frame: CGRect(x: 150, y: 300, width: 100, height: 40))
        button.setTitle("click me", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.white
        view.addSubview(button)
        
        //添加事件响应
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        //创建图片
        let imgView = UIImageView(frame: CGRect(x: 0, y: 50, width: 430, height: 220))
        imgView.image = UIImage(named: "img1")
        view.addSubview(imgView)
        
        let imgView2 = UIImageView(frame: CGRect(x: 0, y: 530, width: 430, height: 300))
        imgView2.image = UIImage(named: "img2")
        view.addSubview(imgView2)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClicked(){
        if let lable = view.subviews.first as? UILabel{
            lable.text = "I was clicked!"
            lable.textColor = UIColor.yellow
            lable.backgroundColor = UIColor.red
            present(SexondViewController(),animated: true,completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
