//
//  AppDelegate.swift
//  home-true-money
//
//  Created by peanut36k on 13/8/19.
//  Copyright © 2019 peanut36k. All rights reserved.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    lazy var flutterEngine = FlutterEngine(name: "miniapp")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
//        flutterEngine.run()
//        GeneratedPluginRegistrant.register(with: self.flutterEngine)
        return true
    }
}
