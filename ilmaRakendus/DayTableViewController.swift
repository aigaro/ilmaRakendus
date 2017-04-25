//
//  DayTableViewController.swift
//  ilmaRakendus
//
//  Created by Aigar Ottas on 24/04/17.
//  Copyright © 2017 Aigar. All rights reserved.
//

import UIKit
import PureLayout

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
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog("rows")
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        NSLog("get cell")
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Cell")
        cell.textLabel!.text = "foo"
        return cell
    } 
  }
