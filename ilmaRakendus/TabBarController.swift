//
//  TabBarController.swift
//  ilmaRakendus
//
//  Created by Aigar on 23/04/17.
//  Copyright © 2017 Aigar. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    private let weatherData: WeatherData
    
    init(weatherData: WeatherData) {
        self.weatherData = weatherData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        let dayTableView = UINavigationController(rootViewController: DayTableViewController(weatherData: weatherData))
        let dayTableTabBarItem = UITabBarItem(title: "Day table", image: nil, selectedImage: nil)
        dayTableView.tabBarItem = dayTableTabBarItem
        
        let nightTableView = UINavigationController(rootViewController: NightTableViewController())
        let nightTableTabBarItem = UITabBarItem(title: "Night table", image: nil, selectedImage: nil)
        nightTableView.tabBarItem = nightTableTabBarItem
        
        self.viewControllers = [
            dayTableView,
            nightTableView
            
        ]

    }
    
}

