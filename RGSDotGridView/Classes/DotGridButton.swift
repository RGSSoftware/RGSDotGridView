//
//  DotsButton.swift
//  ButtonStateAnimation
//
//  Created by PC on 6/21/16.
//  Copyright © 2016 Randel Smith rs@randelsmith.com. All rights reserved.
//

import UIKit

class DotGridButton: UIButton {
    
    var isFull = true
    
    var dotView : DotGridView!

    override init (frame : CGRect) {
        super.init(frame : frame)
        addBehavior()
    }
    
    convenience init () {
        self.init(frame:CGRect.zero)
        addBehavior ()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addBehavior ()
    }
    
    func addBehavior (){
        
        dotView = DotGridView(frame: CGRectMake(30, 30, 20, 20))
        dotView.dotsDiameter = 2
        dotView.dotsColor = UIColor.whiteColor()
        
        self.addSubview(self.dotView);
    }
    
    override func layoutSubviews() {
        self.dotView.center = CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)/2)
    }
    
    override var highlighted: Bool {
        get {
            return super.highlighted
        }
        set {
            if newValue {
                self.dotView.alpha = 0.8
            }
            else {
                self.dotView.alpha = 1
            }
            super.highlighted = newValue
        }
    }
    
    
    override func touchesCancelled(touches: Set<UITouch>!, withEvent event: UIEvent!) {
        
        if self.isFull {
            
            self.dotView.animateClose()
            self.isFull = false
        } else {
            
            self.dotView.animateFull()
            self.isFull = true
        }
        
        
        super.touchesCancelled(touches, withEvent: event)
        
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if self.isFull {
            
            self.dotView.animateClose()
            self.isFull = false
        } else {
            
            self.dotView.animateFull()
            self.isFull = true
        }
        
        super.touchesEnded(touches, withEvent: event)
    }
    

}
