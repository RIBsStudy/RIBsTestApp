//
//  AppDelegate.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/12.
//

import UIKit
import ModernRIBs

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private var launchRouter: LaunchRouting?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let routing = AppRootBuilder(dependency: AppComponent()).build()
        self.launchRouter = routing
        launchRouter?.launch(from: window)

        return true
    }
}
