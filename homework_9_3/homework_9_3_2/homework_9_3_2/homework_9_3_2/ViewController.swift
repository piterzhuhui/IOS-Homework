//
//  ViewController.swift
//  homework_9_3_2
//
//  Created by student on 2018/11/7.
//  Copyright © 2018年 2016110457. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIScrollViewDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let imageView = UIImageView(image: UIImage(named: "1"))
        scrollView.addSubview(imageView)
        scrollView.contentSize = imageView.bounds.size
        
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.2
        scrollView.maximumZoomScale = 5
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollView.subviews.first
    }

}

