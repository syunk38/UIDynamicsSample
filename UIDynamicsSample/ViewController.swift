//
//  ViewController.swift
//  UIDynamicsSample
//
//  Created by Shuntaro Kuroki on 2015/04/16.
//  Copyright (c) 2015年 Shuntaro Kuroki. All rights reserved.
//

//参考
//http://dev.classmethod.jp/references/ios7-uidynamic-1/

import UIKit

class ViewController: UIViewController {
    lazy private var redRect:UIView = self.createRedRect()
    @IBOutlet private var blueRect:UIView?
    var animater:UIDynamicAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(redRect)
        self.layoutRedRect()
        setRedRectAnimateBehavior()
        setBlueRectAnimateBehavior()
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
        //redRect.frame.origin.x = self.view.frame.size.width - redRect.frame.size.width
        redRect.center.x = self.view.center.x
        redRect.center.y = self.view.center.y
    }
    
    private func setRedRectAnimateBehavior() {
        animater = UIDynamicAnimator(referenceView: self.view)
        var gravityBehavior = UIGravityBehavior(items: [self.redRect])
        var collisionBehavior = UICollisionBehavior(items: [self.redRect])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        animater!.addBehavior(gravityBehavior)
        animater!.addBehavior(collisionBehavior)
    }
    
    private func setBlueRectAnimateBehavior() {
        animater = UIDynamicAnimator(referenceView: self.view)
        var gravityBehavior = UIGravityBehavior(items: [self.blueRect!])
        gravityBehavior.angle = 9.0
        var collisionBehavior = UICollisionBehavior(items: [self.blueRect!])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        self.animater!.addBehavior(gravityBehavior)
        self.animater!.addBehavior(collisionBehavior)
    }


}

