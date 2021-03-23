//
//  MainNavigationController.swift
//  TestGithub
//
//  Created by zoff on 2021/3/23.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer?.delegate = self

        //self.navigationBar.setBackgroundImage(UIImage.size(CGSize(width: 1, height: 1)).color(UIColor.db_pink).image, for: .default)

        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.app_color_black]
        // Do any additional setup after loading the view.
    }
    

    @objc private func back() {
        
        self.popViewController(animated: true)
        
    }

}

extension MainNavigationController: UIGestureRecognizerDelegate {}

