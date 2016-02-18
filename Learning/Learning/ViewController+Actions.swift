//
//  ViewController+Actions.swift
//  Learning
//
//  Created by Adam Dahan on 2016-02-18.
//  Copyright © 2016 Adam Dahan. All rights reserved.
//  Used for target action

import UIKit

extension ViewController {
    func gravitate() {
        let gravity = UIGravityBehavior(items: [imageCardView])
        animator.addBehavior(gravity)
        
        let collision = UICollisionBehavior(items: [imageCardView])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        // Potential subclass
        // need to use swift initializer to work
//        let lighthouseChillBehaviour = lighthouseChillBehaviour()
//        animator.addBehavior(lighthouseChillBehaviour)
    }
}
