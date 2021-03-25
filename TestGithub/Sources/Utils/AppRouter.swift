//
//  AppRouter.swift
//  TestGithub
//
//  Created by zoff on 2021/3/23.
//

import URLNavigator

enum AppPushType {
    case history_vc
    case home_vc
    case home_detail_vc

}

extension AppPushType{
    
    var path:String{
        switch self {
        case .home_vc:
            return "TestGitHub://home/homevc"
        case .history_vc:
            return "TestGitHub://history/historyvc"
        case .home_detail_vc:
            return "TestGitHub://history/home_detail_vc"
        }
    }
}

class AppRouter {
    
    @discardableResult
    class func push(_ type:AppPushType, context: Any? = nil) -> UIViewController? {
       
       return navigator.push(type.path, context: context)
    }
    
    @discardableResult
    class func push(_ url:String) -> UIViewController? {
        
        return navigator.push(url)
    }
    

}
