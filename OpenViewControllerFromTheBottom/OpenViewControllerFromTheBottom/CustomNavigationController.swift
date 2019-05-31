//
//  CustomNavigationController.swift
//  OpenViewControllerFromTheBottom
//
//  Created by Stanislav Marynych on 5/30/19.
//  Copyright © 2019 Stanislav Marynych. All rights reserved.
//

import UIKit
import CoreGraphics

class CustomNavigationController: UINavigationController, HalfModalPresentable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = UIColor.white
        navigationBarAppearace.barTintColor = UIColor.white
        navigationBarAppearace.shadowImage = UIImage()
        navigationBarAppearace.setBackgroundImage(UIImage(), for: .default)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return isHalfModalMaximized() ? .default : .lightContent
    }
    
    
}

