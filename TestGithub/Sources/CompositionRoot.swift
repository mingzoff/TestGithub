//
//  CompositionRoot.swift
//  TestGithub
//
//  Created by zoff on 2021/3/23.
//

import URLNavigator


struct AppDependency {
    typealias OpenURLHandler = (_ url: URL, _ options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool
    
    let window: UIWindow
    let configureAppearance: () -> Void
    let openURL: OpenURLHandler
}

let navigator = Navigator()


final class CompositionRoot {
    
    /// Builds a dependency graph and returns an entry view controller.
    static func resolve() -> AppDependency {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        window.makeKeyAndVisible()

        URLNavigationMap.initialize(navigator: navigator)
        
        //网络请求
        let homeService = HomeService(networking: HomeNetworking())
               
        let mainTabBarController = MainTabBarController(reactor: MainTabBarViewReactor(),
                                                        homeParentViewController: HomeViewController(reactor: HomeViewReactor(homeService: homeService), homeSectionDelegateFactory: {
                                                            HomeSectionDelegate()
                                                        }),
                                                        historyViewController: HistoryViewController())
                                          
        
        window.rootViewController = mainTabBarController
        
   
        return AppDependency(
            window: window,
            configureAppearance: self.configureAppearance,
            openURL: self.openURLFactory(navigator: navigator)
        )
     }
    
    static func configureAppearance() {
        //设置APP全局环境
    }
    
    static func openURLFactory(navigator: NavigatorType) -> AppDependency.OpenURLHandler {
       return { url, options -> Bool in
           if navigator.open(url) {
               return true
           }
           if navigator.present(url, wrap: MainNavigationController.self) != nil {
               return true
           }
           return false
       }
    }
   
    
}
