//
//  DotGridView.swift
//  ButtonStateAnimation
//
//  Created by PC on 6/21/16.
//  Copyright © 2016 Randel Smith rs@randelsmith.com. All rights reserved.
//

import UIKit

public class DotGridView: UIView {
    
    public var dotsDiameter : Double = 10;
    public var dotsColor = UIColor.blackColor()
    
    
    private var left = UIView()
    private var top = UIView()
    private var right = UIView()
    private var bottom = UIView()
    
    private var viewValue = [UIView : [String : CGPoint]]()
    
    private var dotVeiws = [UIView]()
    
    override public init (frame : CGRect) {
        super.init(frame : frame)
        addBehavior()
    }
    
    convenience public init () {
        self.init(frame:CGRect.zero)
        addBehavior ()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addBehavior ()
    }
    
    func addBehavior (){
        
        self.userInteractionEnabled = false

    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        for aView in self.dotVeiws {
            aView.removeFromSuperview()
        }
        
        self.dotVeiws.removeAll()
        
        let space = Double((min(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)) - CGFloat((self.dotsDiameter)))/2)
        let size = dotsDiameter
        
        for i in 0...2 {
            for j in 0...2 {
                let aView = UIView(frame: CGRectMake(CGFloat(Double(i) * space), CGFloat(Double(j) * space), CGFloat(size), CGFloat(size)))
                if !(aView.frame.size.width/2 < 1) {
                    aView.layer.cornerRadius = aView.frame.size.width/2
                    aView.clipsToBounds = true
                }
                
               
                aView.backgroundColor = dotsColor
                
                self.addSubview(aView)
                
            
                switch (i,j) {
                case (0, 1):
                    left = aView
                    self.viewValue[aView] = ["start" : aView.center, "end" : CGPointMake(CGFloat(space)/2 + aView.center.x, aView.center.y - CGFloat(space)/2)]
                case (1, 0):
                    top = aView
                    self.viewValue[aView] = ["start" : aView.center, "end" : CGPointMake(CGFloat(space)/2 + aView.center.x, CGFloat(space)/2 + aView.center.y)]
                case (2, 1):
                    right = aView
                    self.viewValue[aView] = ["start" : aView.center, "end" : CGPointMake(aView.center.x - CGFloat(space)/2, CGFloat(space)/2 + aView.center.y)]
                case (1, 2):
                    bottom = aView
                    self.viewValue[aView] = ["start" : aView.center, "end" : CGPointMake(aView.center.x - CGFloat(space)/2, aView.center.y - CGFloat(space)/2)]
                default:
                   ()
                }
                
                dotVeiws.append(aView)
            }
            
        }

    }
    
    public func animateFull()  {
        UIView.animateWithDuration(0.1, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: {
            self.left.center = self.viewValue[self.left]!["start"]!
            self.top.center = self.viewValue[self.top]!["start"]!
            self.right.center = self.viewValue[self.right]!["start"]!
            self.bottom.center = self.viewValue[self.bottom]!["start"]!
            
            }, completion: nil)
    }
    
    public func animateClose() {
        UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: {
            self.left.center = self.viewValue[self.left]!["end"]!
            self.top.center = self.viewValue[self.top]!["end"]!
            self.right.center = self.viewValue[self.right]!["end"]!
            self.bottom.center = self.viewValue[self.bottom]!["end"]!
            }, completion: nil)
    }
}
