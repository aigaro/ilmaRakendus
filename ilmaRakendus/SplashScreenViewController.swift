//
//  SplashScreenViewController.swift
//  ilmaRakendus
//
//  Created by Aigar Ottas on 05/05/2017.
//  Copyright © 2017 Aigar. All rights reserved.
//

import UIKit

protocol SplashScreenViewControllerDelegate: class {
    func splashScreenFinished(with weather: WeatherData?)
}

class SplashScreenViewController: UIViewController {

    weak var delegate: SplashScreenViewControllerDelegate?
    private let manager = WeatherManager()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        manager.reloadWeather { [weak self] weather in
            self?.delegate?.splashScreenFinished(with: weather)
        }
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        spinner.startAnimating()
        view.addSubview(spinner)
        spinner.autoCenterInSuperview()
    }
}
