//
//  MainTabBarController.swift
//  TestGithub
//
//  Created by zoff on 2021/3/23.
//

import Foundation


final class MainTabBarController: UITabBarController,View {

    // MARK: Constants
    fileprivate struct Metric {
        static let tabBarHeight = 44
    }
    
    var disposeBag = DisposeBag()
    
    init(
       reactor: MainTabBarViewReactor,
       homeParentViewController:HomeViewController,
       historyViewController:HistoryViewController
     ) {
        defer { self.reactor = reactor }
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = [homeParentViewController,
                                historyViewController]
            .map{ (viewController) -> UINavigationController in
                let navigationController = MainNavigationController(rootViewController: viewController)
                navigationController.tabBarItem.title = nil
                navigationController.tabBarItem.imageInsets.top = 5
                navigationController.tabBarItem.imageInsets.bottom = -5

                return navigationController
             }
        self.tabBar.barTintColor = .app_color_white
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    
    // MARK: Configuring
    
    func bind(reactor: MainTabBarViewReactor) {
        
        self.rx.didSelect
            .scan((nil, nil)) { state, viewController in
                return (state.1, viewController)
            }.subscribe(onNext: { (fromVc,toVc) in
                 
                print("点击处理Tab点击事件")
            
            }).disposed(by: disposeBag)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
    
}
