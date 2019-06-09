//
//  CurrentWeatherAPI.swift
//  Weather App
//
//  Created by mohamed sayed on 6/9/19.
//  Copyright © 2019 mohamed Sayed. All rights reserved.
//

import Foundation
import UIKit
class CurrentWeatherAPi {
    
    enum WeatherAPiLink {
    case ConvertLink
        
        var ConvertLinkToURL : URL {
            return URL(string: "https://api.darksky.net/forecast/4d82383ea939d4f83e7864211a80ea9d/26.8206,30.8025")!
        }
    }
    class func FetchAndConvertData(Link:URL, completion:@escaping(UIImage?,CurrentWeatherParameter?, Error?)->Void){
        
        let task = URLSession.shared.dataTask(with: Link) { (data, respons, error) in
            guard let data = data else {
                 completion(nil,nil,error)
                return
               
            }
            do {
                let decoder = JSONDecoder()
              let result = try decoder.decode(CurrentWeatherParameter.self, from: data)
                let imageIcon = UIImage(named: result.currently.icon)
                completion(imageIcon,result,nil)
            }catch{
                
            }
        }
        task.resume()
        
    }
}
