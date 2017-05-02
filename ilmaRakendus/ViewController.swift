//
//  ViewController.swift
//  ilmaRakendus
//
//  Created by Aigar on 23/04/17.
//  Copyright © 2017 Aigar. All rights reserved.
//

import UIKit

class ViewController: UITabBarController, UITabBarControllerDelegate {
    
  
    override func viewDidLoad() {
//        super.viewDidLoad()
//        parsedData.parseData()
        self.delegate = self    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        parsedData.parseData()
        super.viewWillAppear(animated)
        
        let dayTableView = UINavigationController(rootViewController: DayTableViewController())
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

