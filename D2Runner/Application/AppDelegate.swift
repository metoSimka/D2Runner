//
//  AppDelegate.swift
//  D2Runner
//
//  Created by Simka on 21.02.2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.rootViewController = RunnerRouter().controller()
        window?.makeKeyAndVisible()
        return true
    }
}
