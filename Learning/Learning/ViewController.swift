//
//  ViewController.swift
//  Learning
//
//  Created by Adam Dahan on 2016-02-18.
//  Copyright © 2016 Adam Dahan. All rights reserved.
//

import UIKit
import Material

class ViewController: UIViewController {
    
    let imageCardView: ImageCardView = ImageCardView()
    var animator: UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        prepareImageCardView()
        prepareAnimator()
    }
}


