//
//  WeatherParser.swift
//  ilmaRakendus
//
//  Created by Aigar on 23/04/17.
//  Copyright © 2017 Aigar. All rights reserved.
//

import UIKit
import Alamofire
import SWXMLHash

class RequestMaker {
    func getWeatherData(completion: @escaping ((Data?, Error?)) ->  Void) {
        Alamofire.request("https://www.ilmateenistus.ee/ilma_andmed/xml/forecast.php").response { response in
            completion((response.data, response.error))
        }
    }
}

class WeatherParser {
    
    func parse(data: Data, completion: @escaping (WeatherData?) ->  Void) {
        let xmlData = SWXMLHash.lazy(data)
        var weather = WeatherData()
        
        weather.tempMinDay = Int(xmlData["forecasts"]["forecast"][date]["day"]["tempmin"].element!.text!)!
        weather.tempMaxDay = Int(xmlData["forecasts"]["forecast"][date]["day"]["tempmax"].element!.text!)!
        weather.weatherTextDay = xmlData["forecasts"]["forecast"][date]["day"]["text"].element!.text!
        weather.tempMinNight = Int(xmlData["forecasts"]["forecast"][date]["night"]["tempmin"].element!.text!)!
        weather.tempMaxNight = Int(xmlData["forecasts"]["forecast"][date]["night"]["tempmax"].element!.text!)!
        weather.weatherTextNight = xmlData["forecasts"]["forecast"][date]["night"]["text"].element!.text!
        weather.weatherPlacePhenomenonDay = xmlData["forecasts"]["forecast"][0]["day"]["place"][weatherPlace]["phenomenon"].element!.text!
        weather.weatherPlacePhenomenonNight = xmlData["forecasts"]["forecast"][0]["night"]["place"][weatherPlace]["phenomenon"].element!.text!
        weather.weatherPlaceTemperatureNight = Int(xmlData["forecasts"]["forecast"][0]["night"]["place"][weatherPlace]["tempmin"].element!.text!)!
        weather.weatherPlaceTemperatureDay = Int(xmlData["forecasts"]["forecast"][0]["day"]["place"][weatherPlace]["tempmax"].element!.text!)!
        for i in 0...3 {
            weather.chosenDate.append(xmlData["forecasts"]["forecast"][i].element!.attribute(by: "date")!.text)
        }
        completion(weather)
    }
    
    func parseData(completion: @escaping (WeatherData?) ->  Void) {
        Alamofire.request("https://www.ilmateenistus.ee/ilma_andmed/xml/forecast.php").responseString {
            response in
            print("Success: \(response.result.isSuccess)")
            print("Fail: \(response.result.isFailure)")
            guard let data = response.result.value else {
                completion(nil)
                return
            }
            if response.result.isSuccess == true {
                let xmlData = SWXMLHash.lazy(data)
                var weather = WeatherData()
                
                weather.tempMinDay = Int(xmlData["forecasts"]["forecast"][date]["day"]["tempmin"].element!.text!)!
                weather.tempMaxDay = Int(xmlData["forecasts"]["forecast"][date]["day"]["tempmax"].element!.text!)!
                weather.weatherTextDay = xmlData["forecasts"]["forecast"][date]["day"]["text"].element!.text!
                weather.tempMinNight = Int(xmlData["forecasts"]["forecast"][date]["night"]["tempmin"].element!.text!)!
                weather.tempMaxNight = Int(xmlData["forecasts"]["forecast"][date]["night"]["tempmax"].element!.text!)!
                weather.weatherTextNight = xmlData["forecasts"]["forecast"][date]["night"]["text"].element!.text!
                weather.weatherPlacePhenomenonDay = xmlData["forecasts"]["forecast"][0]["day"]["place"][weatherPlace]["phenomenon"].element!.text!
                weather.weatherPlacePhenomenonNight = xmlData["forecasts"]["forecast"][0]["night"]["place"][weatherPlace]["phenomenon"].element!.text!
                weather.weatherPlaceTemperatureNight = Int(xmlData["forecasts"]["forecast"][0]["night"]["place"][weatherPlace]["tempmin"].element!.text!)!
                weather.weatherPlaceTemperatureDay = Int(xmlData["forecasts"]["forecast"][0]["day"]["place"][weatherPlace]["tempmax"].element!.text!)!
                for i in 0...3 {
                    weather.chosenDate.append(xmlData["forecasts"]["forecast"][i].element!.attribute(by: "date")!.text)
                }
                completion(weather)
            } else
            {
                completion(nil)
            }
        }
        
    }
    
}

