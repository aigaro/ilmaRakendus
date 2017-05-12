//
//  DayTableViewController.swift
//  ilmaRakendus
//
//  Created by Aigar Ottas on 24/04/17.
//  Copyright © 2017 Aigar. All rights reserved.
//

import UIKit
import PureLayout

class NightTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        NSLog("get cell")
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Cell")
        cell.textLabel!.text = weatherData.chosenDate[indexPath.row]
        cell.detailTextLabel?.text = "Night"
        cell.imageView?.image = UIImage(named: weatherData.nightImages[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        weather.selectedDate = indexPath.row
        navigationController?.pushViewController(NightPlaceTableViewController(weatherData:weatherData), animated: true)
    }
}
