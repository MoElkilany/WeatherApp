//
//  ViewController.swift
//  Weather App
//
//  Created by mohamed sayed on 6/9/19.
//  Copyright © 2019 mohamed Sayed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CurrentTemperatur: UILabel!
    @IBOutlet weak var CurrentHumidityLable: UILabel!
    @IBOutlet weak var CurrentRainLable: UILabel!
    @IBOutlet weak var CurrentSummaryLable: UILabel!
    @IBOutlet weak var CurrentWeatherIcons: UIImageView!
    @IBOutlet weak var Loding: UIActivityIndicatorView!
    @IBOutlet weak var CurrentTimeZoneLable: UILabel!
    @IBOutlet weak var refercherButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ReloadNewWeather() 
    }
    
    @IBAction func ReloadNewWeather() {
 
        self.ReferechAnimation(on: true)
        let link = CurrentWeatherAPi.WeatherAPiLink.ConvertLink.ConvertLinkToURL
        CurrentWeatherAPi.FetchAndConvertData(Link: link) { (image, result, error) in
            DispatchQueue.main.async {
                self.CurrentTemperatur.text = "\(Int((result?.currently.temperature)!))º"
                self.CurrentHumidityLable.text = "\(Int(((result?.currently.humidity)! * 100)))%"
                self.CurrentRainLable.text = "\(Int(((result?.currently.precipProbability)! * 100)))%"
                self.CurrentSummaryLable.text = result?.currently.summary
                self.CurrentTimeZoneLable.text = result?.timezone
                self.CurrentWeatherIcons.image = image
              self.ReferechAnimation(on: false)
            }
        }
    }
    
    func ReferechAnimation(on:Bool){
        refercherButton.isHidden = on 
        if on {
            Loding.startAnimating()
        }else {
            Loding.stopAnimating()
        }
    }
}
