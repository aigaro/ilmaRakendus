//
//  NightPlaceTableViewController.swift
//  ilmaRakendus
//
//  Created by Aigar Ottas on 12/05/2017.
//  Copyright © 2017 Aigar. All rights reserved.
//

import UIKit

class NightPlaceTableViewController: UITableViewController {
    
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
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.weatherPlaces.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        NSLog("get cell")
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Cell")
        switch Int(weather.selectedDate) {
        case 0:
            cell.textLabel?.text = weather.weatherPlaces[indexPath.row]
            
            cell.imageView?.image = UIImage(named: weatherData.placePhenomenonNight[indexPath.row])
            cell.detailTextLabel?.text = "\(weatherData.placeTemperatureNight[indexPath.row]) to \(weatherData.placeTemperatureDay[indexPath.row])"
            return cell
        case 1...weather.weatherPlaces.count:
            cell.textLabel?.text = weather.weatherTextNight
            return cell
        default:
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
}
