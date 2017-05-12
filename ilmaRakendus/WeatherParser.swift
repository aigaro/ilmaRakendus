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
        
        for i in 0...5 {
            weather.placePhenomenonDay.append(xmlData["forecasts"]["forecast"][0]["day"]["place"][i]["phenomenon"].element!.text!)
        }
        for i in 0...5 {
            weather.placePhenomenonNight.append(xmlData["forecasts"]["forecast"][0]["night"]["place"][i]["phenomenon"].element!.text!)
        }
        for i in 0...5 {
            weather.placeTemperatureNight.append(xmlData["forecasts"]["forecast"][0]["night"]["place"][i]["tempmin"].element!.text!)
        }
        print(weather.placeTemperatureNight)

        for i in 0...5 {
            weather.placeTemperatureDay.append(xmlData["forecasts"]["forecast"][0]["day"]["place"][i]["tempmax"].element!.text!)
        }
        
        for i in 0...3 {
            weather.dayImages.append(xmlData["forecasts"]["forecast"][i]["day"]["phenomenon"].element!.text!)
        }
        
        for i in 0...3 {
            weather.nightImages.append(xmlData["forecasts"]["forecast"][i]["night"]["phenomenon"].element!.text!)
        }
        
        for i in 0...3 {
            weather.chosenDate.append(xmlData["forecasts"]["forecast"][i].element!.attribute(by: "date")!.text)
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let date1 = formatter.date(from: weather.chosenDate[0])
        let date2 = formatter.date(from: weather.chosenDate[1])
        let date3 = formatter.date(from: weather.chosenDate[2])
        let date4 = formatter.date(from: weather.chosenDate[3])
        formatter.dateStyle = .medium
        let date1a = formatter.string(from: date1!)
        let date2a = formatter.string(from: date2!)
        let date3a = formatter.string(from: date3!)
        let date4a = formatter.string(from: date4!)
        
        weather.chosenDate = [date1a, date2a, date3a, date4a]
        completion(weather)
    }
    
}

