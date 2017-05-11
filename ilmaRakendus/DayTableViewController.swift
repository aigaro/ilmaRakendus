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

protocol Vehicle {
    var dimensions: CGSize { get }
}

protocol VehicleAccessories {
    var radio: Bool { get }
}

typealias CoolVechile = Vehicle & VehicleAccessories

class Tractor: Vehicle {
    var dimensions: CGSize = .zero
}

class Ferrari: CoolVechile {
    var dimensions: CGSize  = .zero
    var radio: Bool = true
}

func hande(vehicle: Vehicle) {
    
}


//class Car {
//    var radio: Bool
//    
//    init() {
//        radio = true
//    }
//}
//
//
//class CarSubClass: Car {
//    override var radio: Bool = true
//}

//hande(vehicle: Tractor())
//hande(vehicle: Ferrari())


class DayTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
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
        return weatherData.weatherPlaces.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog("rows")
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        NSLog("get cell")
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Cell")
        cell.textLabel!.text = weatherData.chosenDate[indexPath.row]
        cell.detailTextLabel?.text = "Day"
        cell.imageView?.image = UIImage(named:weatherData.dayImages[indexPath.row])
        print(weatherData.dayImages)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(TestTableViewController(), animated: true)
    }
  }
