//
//  URLNavigationMap.swift
//  TestGithub
//
//  Created by zoff on 2021/3/23.
//

import URLNavigator


final class URLNavigationMap {
    
    static func initialize(navigator:NavigatorType) {
        
        navigator.register(AppPushType.history_vc.path) { (url, values, context) -> UIViewController? in
            return HistoryViewController()
        }
     
    }
    
  
    
}
