//
//  ViewController.swift
//  homework_6_3
//
//  Created by student on 2018/10/25.
//  Copyright © 2018年 dqw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let redView = UIView()
        redView.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        
        let greenView = UIView()
        greenView.backgroundColor = #colorLiteral(red: 0.7312461138, green: 1, blue: 0.5654845834, alpha: 1)
       
        
        let yellowView = UIView()
        yellowView.backgroundColor = #colorLiteral(red: 0.9370312095, green: 1, blue: 0, alpha: 1)
        
        let stackView = UIStackView(arrangedSubviews: [redView,greenView,yellowView])
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

