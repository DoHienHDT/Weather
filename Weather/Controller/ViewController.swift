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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.backgroundColor = UIColor.clear
        DataService.shared.getDataFromApiClosure { [unowned self] (forecastDay) in
            self.dataWeather = forecastDay
            self.dataForecastday = forecastDay.weatherDay
            self.nameLabel.text = forecastDay.name
            self.temp_cLabel.text = (String(forecastDay.temp_c)) + "º"
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

