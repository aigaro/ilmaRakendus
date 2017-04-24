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

class WeatherParser {
    func parseData() {
        Alamofire.request("https://www.ilmateenistus.ee/ilma_andmed/xml/forecast.php").responseString {
         response in
            print("Success: \(response.result.isSuccess)")
            print("Fail: \(response.result.isFailure)")
            guard let data = response.result.value else {
                return
            }
            print(data)
        }
    }
}
