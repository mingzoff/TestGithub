//
//  HomeViewController.swift
//  TestGithub
//
//  Created by zoff on 2021/3/23.
//

import UIKit

final class HomeViewController: BaseViewController {

    private let homeService: HomeServiceType

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"

        // Do any additional setup after loading the view.
    }
    
    init(service:HomeServiceType) {
        self.homeService = service
        super.init()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
