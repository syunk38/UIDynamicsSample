//
//  ViewController.swift
//  UIDynamicsSample
//
//  Created by Shuntaro Kuroki on 2015/04/16.
//  Copyright (c) 2015年 Shuntaro Kuroki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy private var redRect:UIView = self.createRedRect()
    var animater:UIDynamicAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(redRect)
        self.animater? = UIDynamicAnimator(referenceView: self.view)
        var items:Array = [self.redRect]
        var gravityBehavior = UIGravityBehavior(items: items)
        var collisionBehavior = UICollisionBehavior(items: items)
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        
        self.animater?.addBehavior(gravityBehavior)
        self.animater?.addBehavior(collisionBehavior)
        
    }
    
    override func viewDidLayoutSubviews() {
        self.layoutRedRect()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createRedRect() ->UIView {
        let rect = UIView(frame: CGRectZero)
        rect.backgroundColor = UIColor.redColor()
        return rect;
    }
    
    private func layoutRedRect() {
        redRect.frame.size = CGSizeMake(50,50)
        redRect.frame.origin.x = self.view.frame.size.width - redRect.frame.size.width
        redRect.center.y = self.view.center.y
    }


}

