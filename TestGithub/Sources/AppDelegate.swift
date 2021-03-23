//
//  AppDelegate.swift
//  TestGithub
//
//  Created by zoff on 2021/3/17.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Properties
    var dependency: AppDependency!
    
    
    // MARK: UI
    var window: UIWindow?

    // MARK: UIApplicationDelegate
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.dependency = self.dependency ?? CompositionRoot.resolve()
        self.window = self.dependency.window
        self.dependency.configureAppearance()

        
        return true
    }




}

