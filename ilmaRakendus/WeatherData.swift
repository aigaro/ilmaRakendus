//
//  WeatherData.swift
//  ilmaRakendus
//
//  Created by Aigar Ottas on 01/05/2017.
//  Copyright © 2017 Aigar. All rights reserved.
//

import UIKit

struct WeatherData {

    var weatherDictionary: [String:String] = ["Clear": "Selge", "Few clouds": "Vähene pilvisus", "Variable clouds": "Vahelduv pilvisus", "Cloudy with clear spells": "Pilves selgimistega", "Cloudy": "Pilves", "Light snow shower": "Nõrk hooglumi", "Moderate snow shower": "Mõõdukas hooglumi", "Heavy snow shower": "Tugev hooglumi", "Light shower": "Nõrk hoogvihm", "Moderate shower": "Mõõdukas hoogvihm", "Heacy shower": "Tugev hoogvihm", "Light rain": "Nõrk vihm", "Moderate rain": "Mõõdukas vihm", "Heavy rain": "Tugev vihm", "Risk of glaze": "Jäiteoht", "Light sleet": "Nõrk lörtsisadu", "Moderate sleet": "Mõõdukas lörtsisadu", "Light snowfall": "Nõrk lumesadu", "Moderate snowfall": "Mõõdukas lumesadu", "Heavy snowfall": "Tugev lumesadu", "Snowstorm": "Lumetuisk", "Drifting snow": "Pinnatuisk", "Hail": "Rahe", "Mist": "Uduvine", "Fog": "Udu", "Thunder": "Äike", "Thunderstorm": "Äikesevihm"]
    var weatherPlaces: [String] = ["Harku", "Jõhvi", "Tartu", "Pärnu", "Kuressaare", "Türi"]

    var tempMinDay = Int()
    var tempMaxDay = Int()
    var weatherTextDay = String()
    var arrayMin = [Int]()
    var arrayMax = [Int]()
    var tempMinNight = Int()
    var tempMaxNight = Int()
    var weatherTextNight = String()
    var weatherDate = [String]()
    var chosenDate = [String]()
    var selectedDate = Int()
    var weatherPlacePhenomenonDay = String()
    var weatherPlacePhenomenonNight = String()
    var dayImages = [String]()
    var nightImages = [String]()
    var weatherPlaceTemperatureNight = Int()
    var weatherPlaceTemperatureDay = Int()
    var placePhenomenonDay = [String]()
    var placePhenomenonNight = [String]()

}
