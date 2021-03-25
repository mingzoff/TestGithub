//
//  URLNavigationMap.swift
//  TestGithub
//
//  Created by zoff on 2021/3/23.
//

import URLNavigator
import ObjectMapper


final class URLNavigationMap {
    
    static func initialize(navigator:NavigatorType) {
        
        navigator.register(AppPushType.history_vc.path) { (url, values, context) -> UIViewController? in
            return HistoryViewController()
        }
        
        navigator.register(AppPushType.home_detail_vc.path) { (url, values, context) -> UIViewController? in
            
            guard let context = context as? HomeGitHubModel
            else { return nil }
            let vc =  HomeDetailViewController()
                vc.gitHubModel = context
                vc.hidesBottomBarWhenPushed = true
            return vc
        }

     
    }
    
  
    
}
