//
//  DayTableViewController.swift
//  ilmaRakendus
//
//  Created by Aigar Ottas on 24/04/17.
//  Copyright © 2017 Aigar. All rights reserved.
//

import UIKit
import PureLayout

var testDates:Array = ["D1", "D2", "D3", "D4"]

class DayTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView: UITableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
    
        view.addSubview(tableView)
        tableView.autoPinEdgesToSuperviewEdges()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        NSLog("sections")
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog("rows")
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        NSLog("get cell")
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Cell")
        cell.textLabel!.text = testDates[indexPath.row]
//        cell.textLabel!.text = weather.chosenDate[indexPath.row]
//        print(weather.chosenDate[0])
        print("TESTER")
        print(weather)
//        print(weather.chosenDate)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(TestTableViewController(), animated: true)
//        print(weather.chosenDate[0])
    }
  }
