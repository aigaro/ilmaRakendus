//
//  AppDelegate.swift
//  ilmaRakendus
//
//  Created by Aigar on 23/04/17.
//  Copyright © 2017 Aigar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var appStarter: AppStarter?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        appStarter = AppStarter(window: window)
        return true
    }
}


