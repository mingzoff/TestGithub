//
//  ViewController.swift
//  TestGithub
//
//  Created by zoff on 2021/3/17.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let lab : UILabel = UILabel()
        lab.textColor = UIColor.red
        lab.font = UIFont.systemFont(ofSize: 14)
        lab.text = "测试"
        lab.frame = CGRect.init(x: 20, y: 40, width: 100, height: 20)
        self.view.addSubview(lab)
        
    
    }


}

