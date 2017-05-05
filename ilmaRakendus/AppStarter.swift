//
//  AppStarter.swift
//  ilmaRakendus
//
//  Created by Aigar Ottas on 05/05/2017.
//  Copyright © 2017 Aigar. All rights reserved.
//

import UIKit

class AppStarter {
    
    fileprivate let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
        let splash = SplashScreenViewController()
        splash.delegate = self
        window?.rootViewController = splash
        window?.makeKeyAndVisible()
    }
}

extension AppStarter: SplashScreenViewControllerDelegate {
    func splashScreenFinished(with weather: WeatherData?) {
        guard let weather = weather else {
            return
        }
        window?.rootViewController = TabBarController(weatherData: weather)
    }
}
