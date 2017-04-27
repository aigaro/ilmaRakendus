//
//  ViewController.swift
//  ilmaRakendus
//
//  Created by Aigar on 23/04/17.
//  Copyright © 2017 Aigar. All rights reserved.
//

import UIKit

class ViewController: UITabBarController, UITabBarControllerDelegate {
    
    let parsedData = WeatherParser()
    
    let nightTableView = NightTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parsedData.parseData()
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let dayTableView = DayTableViewController()
        let dayTableTabBarItem = UITabBarItem(title: "Day table", image: nil, selectedImage: nil)
        dayTableView.tabBarItem = dayTableTabBarItem
        
        let nightTableView = NightTableViewController()
        let nightTableTabBarItem = UITabBarItem(title: "Night table", image: nil, selectedImage: nil)
        nightTableView.tabBarItem = nightTableTabBarItem
        
//        let dayTab = DayViewController()
//        let dayTabBarItem = UITabBarItem(title: "Day", image: nil, selectedImage: nil)
//        dayTab.tabBarItem = dayTabBarItem
//        
//        let nightTab = NightViewController()
//        let nightTabBarItem = UITabBarItem(title: "Night", image: nil, selectedImage: nil)
//        nightTab.tabBarItem = nightTabBarItem
        
        self.viewControllers = [
//            UINavigationController(rootViewController: dayTableView),
            dayTableView,
            nightTableView
//            dayTab,
//            nightTab
        ]
    }
//    
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
////        print(viewController.title!)
//    }
    
    
}

