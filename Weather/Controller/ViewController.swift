//
//  ViewController.swift
//  Weather
//
//  Created by dohien on 08/08/2018.
//  Copyright © 2018 dohien. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var dataWeather: Forecastday?
    var dataForecastday: [ArrayForecastday] = []
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var temp_cLabel: UILabel!
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var avghumidityLabel: UILabel!
    @IBOutlet weak var wind_kphLabel: UILabel!
    @IBOutlet weak var vis_kmLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.backgroundColor = UIColor.clear
        DataService.shared.getDataFromApiClosure { [unowned self] (forecastDay) in
            self.dataWeather = forecastDay
            self.dataForecastday = forecastDay.weatherDay
            self.nameLabel.text = forecastDay.name
            self.todayLabel.text = forecastDay.localtime_epoch.getDaysOfWeek()
            self.temp_cLabel.text = (String(forecastDay.temp_c)) + "º"
            self.avghumidityLabel.text = (String((Int(forecastDay.humidity)))) + "%"
            self.wind_kphLabel.text = (String(Int(forecastDay.wind_kph))) + "m/s"
            self.vis_kmLabel.text = String(Int(forecastDay.vis_km)) + "Km"
            self.tableview.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataForecastday.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.nameTextField.text = dataForecastday[indexPath.row].date_epoch.getDaysOfWeek()
        cell.maxtemp_cLabel.text = (String(Int(dataForecastday[indexPath.row].maxtemp_c))) + "º"
        cell.mintemp_cLabel.text = (String(Int(dataForecastday[indexPath.row].mintemp_c))) + "º"
        cell.photoImage.imageUrlString(urlString: dataForecastday[indexPath.row].icon, indexpath: indexPath)
        return cell
    }


}

