//
//  ViewController.swift
//  homework_9_3
//
//  Created by student on 2018/11/7.
//  Copyright © 2018年 2016110457. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIScrollViewDelegate{

    
    @IBOutlet weak var scrollview: UIScrollView!
    
    
    @IBOutlet weak var pageControll: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        scrollview.delegate = self
        for i in 1...7{
            let imageView = UIImageView(image: UIImage(named: "\(i)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: CGFloat(i-1) * scrollview.bounds.width, y: 0, width: scrollview.bounds.width, height: scrollview.bounds.height)
            scrollview.addSubview(imageView)//加到界面中去
        }
        
        scrollview.contentSize = CGSize(width: scrollview.bounds.width * 7, height: scrollview.bounds.height)
        scrollview.isPagingEnabled = true    //可以翻页
        scrollview.showsHorizontalScrollIndicator = false
        
        pageControll.numberOfPages = 7
        pageControll.currentPage = 0   //当前页
    }
    
    
    
    
    @IBAction func pageControllClicked(_ sender: UIPageControl) {
        let currentPage = sender.currentPage
        let rect = CGRect(x: CGFloat(currentPage) * scrollview.bounds.width, y: 0, width: scrollview.bounds.width, height: scrollview.bounds.height)
        scrollview.scrollRectToVisible(rect, animated: true)

    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = scrollView.contentOffset.x/scrollView.bounds.width
        pageControll.currentPage = Int(currentPage)
    }

    
}

