//
//  ViewController.swift
//  RGSDotGridView
//
//  Created by Randel Smith on 06/21/2016.
//  Copyright (c) 2016 Randel Smith. All rights reserved.
//

import UIKit
import RGSDotGridView

class ViewController: UIViewController {
    
    var isFull = true
    
    @IBOutlet weak var dotGridButton: DotGridButton!
    
    var dotGridView : DotGridView!

    override func viewDidLoad() {
        super.viewDidLoad()

       self.dotGridButton.layer.cornerRadius = CGRectGetWidth(self.dotGridButton.frame)/2
        
        self.dotGridView = DotGridView(frame: CGRectMake(0, CGRectGetMaxY(self.dotGridButton.frame) + 10, 50, 50))
        self.dotGridView.userInteractionEnabled = false
        self.dotGridView.dotsDiameter = 2
        self.dotGridView.dotsColor = UIColor.yellowColor()
        self.view.addSubview(self.dotGridView);
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.dotGridView.center = CGPointMake(self.dotGridButton.center.x, self.dotGridView.center.y)
    }

    @IBAction func animateDotGridView(sender: AnyObject) {
        if self.isFull {
            
            self.dotGridView.animateClose()
            self.isFull = false
        } else {
            
            self.dotGridView.animateFull()
            self.isFull = true
        }
    }
}

