//
//  ViewController+Preparation.swift
//  Learning
//
//  Created by Adam Dahan on 2016-02-18.
//  Copyright © 2016 Adam Dahan. All rights reserved.
//

import UIKit
import Material

extension ViewController {    
    func prepareView() {
        view.backgroundColor = UIColor.whiteColor()
    }
    
    func prepareImageCardView() {
        
        imageCardView.frame = CGRect(x: 20, y: 20, width: 300, height: 200)
        
        // Image.
        let size: CGSize = CGSizeMake(UIScreen.mainScreen().bounds.width - CGFloat(40), 150)
        imageCardView.image = UIImage.imageWithColor(UIColor.snazzyBlue(), size: size)
        
        // Title label.
        let titleLabel: UILabel = UILabel()
        titleLabel.text = "Welcome Back!"
        titleLabel.textColor = MaterialColor.white
        titleLabel.font = RobotoFont.mediumWithSize(24)
        imageCardView.titleLabel = titleLabel
        imageCardView.titleLabelInset.top = 100
        
        // Detail label.
        let detailLabel: UILabel = UILabel()
        detailLabel.text = "It’s been a while, have you read any new books lately?"
        detailLabel.numberOfLines = 0
        imageCardView.detailView = detailLabel
        
        // Yes button.
        let btn1: FlatButton = FlatButton()
        btn1.pulseColor = MaterialColor.cyan.lighten1
        btn1.pulseScale = false
        btn1.setTitle("YES", forState: .Normal)
        btn1.setTitleColor(MaterialColor.cyan.darken1, forState: .Normal)
        
        // No button.
        let btn2: FlatButton = FlatButton()
        btn2.pulseColor = MaterialColor.cyan.lighten1
        btn2.pulseScale = false
        btn2.setTitle("NO", forState: .Normal)
        btn2.setTitleColor(MaterialColor.cyan.darken1, forState: .Normal)
        btn2.addTarget(self, action: "gravitate", forControlEvents: .TouchUpInside)
        
        // Add buttons to left side.
        imageCardView.leftButtons = [btn1, btn2]
        
        // To support orientation changes, use MaterialLayout.
        view.addSubview(imageCardView)
    }
    
    func prepareAnimator() {
        animator = UIDynamicAnimator(referenceView: view)
    }
}
