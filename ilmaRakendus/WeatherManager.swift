//
//  WeatherManager.swift
//  ilmaRakendus
//
//  Created by Aigar Ottas on 05/05/2017.
//  Copyright © 2017 Aigar. All rights reserved.
//

import Foundation

class WeatherManager {
    
    private let requestMaker = RequestMaker()
    private let parser = WeatherParser()

    func reloadWeather(completion: @escaping (WeatherData?) ->  Void) {
        requestMaker.getWeatherData { [weak self] data, error in
            self?.handle(data, error, completion: completion)
        }
    }
    
    private func handle(_ data: Data?, _ error: Error?, completion: @escaping (WeatherData?) ->  Void) {
        if error != nil {
            completion(nil)
        } else if let data = data {
            parser.parse(data: data, completion: completion)
        } else {
            completion(nil)
        }
    }
}
