//
//  ViewController.swift
//  HBExpandButton
//
//  Created by Raizo on 16/7/6.
//  Copyright © 2016年 Raizo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        let myBtn = HBExpandButton(frame:   CGRect(x: 100, y: 200, width: 30, height: 30))
        
        myBtn.layer.cornerRadius = 15
        myBtn.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(myBtn)
        
        let subBtn1 = UIButton()
        subBtn1.frame.size = CGSize(width: 30, height: 30)
        subBtn1.backgroundColor = UIColor.redColor()
        subBtn1.addTarget(self, action: #selector(ViewController.btn1Tapped), forControlEvents: .TouchUpInside)
        
        let subBtn2 = UIButton()
        subBtn2.frame.size = CGSize(width: 30, height: 30)
        subBtn2.backgroundColor = UIColor.blueColor()
        subBtn2.addTarget(self, action: #selector(ViewController.btn2Tapped), forControlEvents: .TouchUpInside)
        
        myBtn.subBtnArray = [subBtn1, subBtn2]
        
        
    }
    
    func btn1Tapped() {
        print("1")
    }
    
    func btn2Tapped() {
        print("2")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

