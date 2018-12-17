//
//  ViewController.swift
//  homework_10_3
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 zhuhui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    基于UIDynamicAnimtor实现简单的力学动画
//    可以掉落方块
//    有碰撞
//    可以反弹
    
    
    @IBOutlet weak var backView: UIView!
    
    lazy var animator = UIDynamicAnimator(referenceView: self.backView)
    
    let gravity = UIGravityBehavior()
    let collision = UICollisionBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        collision.translatesReferenceBoundsIntoBoundary = true
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func add(_ sender: Any) {
        let width = Int(backView.bounds.width / 10)
        let randx = Int(arc4random() % 10) * width
        let lable = UILabel(frame: CGRect(x: randx, y: 20, width: width, height: width))
        lable.backgroundColor = UIColor.red
        lable.text = "A"
        lable.textAlignment = .center
        backView.addSubview(lable)
        gravity.addItem(lable)
        collision.addItem(lable)
    }
    
    @IBAction func up(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: -1)
    }
    
    @IBAction func down(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: 1)
    }
    
    @IBAction func left(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: -1, dy: 0)
    }
    
    @IBAction func right(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 1, dy: 0)
    }
    
    @IBAction func deleteAll(_ sender: Any) {
        for item in backView.subviews{
            if item is UILabel{
                item.removeFromSuperview()
            }
        }
        
    }
    
}

