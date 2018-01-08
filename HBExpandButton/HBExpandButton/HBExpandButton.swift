//
//  HBExpandButton.swift
//  HBExpandButton
//
//  Created by Raizo on 16/7/6.
//  Copyright © 2016年 Raizo. All rights reserved.
//

import UIKit

class HBExpandButton: UIButton {
    
    var subBtnArray = [UIButton]() {
        didSet {
            if self.superview != nil {
                setSubBtn()
            }
        }
    }
    var isPush = false
    var pushRadius: CGFloat = 50
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(HBExpandButton.btnTapped(_:)), forControlEvents: .TouchUpInside)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func btnTapped(button: UIButton) {
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = NSNumber(float: 1.0)
        scaleAnimation.toValue = NSNumber(float: 1.5)
        scaleAnimation.autoreverses = true
        scaleAnimation.fillMode = kCAFillModeForwards
        scaleAnimation.repeatCount = 1
        scaleAnimation.duration = 0.3
        button.layer.addAnimation(scaleAnimation, forKey: "scaleAnimation")
        isPush ?  setSubBtnPopAnimation() : setSubBtnPushAnimation()
        
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if subBtnArray.count != 0 {
            setSubBtn()
        }
    }
    
    func setSubBtn() {
        
        for button in subBtnArray {
            button.center = self.center
            button.layer.cornerRadius = button.frame.size.width/2
            self.superview!.addSubview(button)
        }
        self.superview!.bringSubviewToFront(self)
        
    }
    
    func setSubBtnPushAnimation() {
        
        for (index, button) in subBtnArray.enumerate() {
            
            let pushAnimation = CABasicAnimation(keyPath: "position")
            
            let angle =  CGFloat(180/(subBtnArray.count) * (index) + 180/(subBtnArray.count)/2)
            let endPoint = calcCircleCoordinate(self.center, myangle:angle, radius: pushRadius)
            pushAnimation.fromValue = NSValue(CGPoint: self.center)
            pushAnimation.toValue = NSValue(CGPoint: endPoint)
            pushAnimation.removedOnCompletion = false
            pushAnimation.autoreverses = false
            pushAnimation.fillMode = kCAFillModeForwards
            pushAnimation.duration = 0.3
            button.layer.position = endPoint
            button.layer.addAnimation(pushAnimation, forKey: "pushAnimation")
            
            
        }
        
        isPush = true
        
    }
    
    
    func setSubBtnPopAnimation() {
        
        for button in subBtnArray {
            let popAnimation = CABasicAnimation(keyPath: "position")
            popAnimation.toValue = NSValue(CGPoint:self.center)
            popAnimation.removedOnCompletion = false
            popAnimation.autoreverses = false
            popAnimation.fillMode = kCAFillModeForwards
            popAnimation.duration = 0.3
            button.layer.position = self.center
            button.layer.addAnimation(popAnimation, forKey: "popAnimation")
        }
        
        isPush = false
    }
    
    func calcCircleCoordinate(center: CGPoint, myangle: CGFloat, radius: CGFloat) -> CGPoint {
        
        let value = Float(myangle * 3.14 / 180)
        let x2 = radius * CGFloat(cosf(value))
        let y2 = radius * CGFloat(sinf(value))
        let a = CGPoint(x: center.x + x2, y: center.y - y2)
        return a
        
    }
    
}