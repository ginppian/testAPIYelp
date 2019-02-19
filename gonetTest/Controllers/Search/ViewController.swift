//
//  ViewController.swift
//  gonetTest
//
//  Created by Gmo Ginppian on 2/15/19.
//  Copyright © 2019 ginppian. All rights reserved.
//

import UIKit
import CoreLocation
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var myLabel: UILabel  = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.gray
        label.text = "No se encontraron datos..."
        label.font = UIFont(name: "Helvetica-Regular", size: 19)
        label.numberOfLines = 1
        label.sizeToFit()
        label.textAlignment = .center
        return label
    }()
    var myActivity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .gray)
        activity.alpha = 1.0
        activity.translatesAutoresizingMaskIntoConstraints = false
        return activity
    }()
    
    var locationManager: CLLocationManager!
    var latitude: NSNumber?
    var longitude: NSNumber?
    
    var businesses = [BussinessYelpModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        initCurrentLocation()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}
// MARK: - TableView Data Source
extension ViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell {
            
            cell.yImg?.sd_setImage(with: SearchModelView.searchImg(bussiness: self.businesses[indexPath.row]), completed: nil)
            cell.yLblTitle.text = SearchModelView.searchName(bussiness: self.businesses[indexPath.row])
            cell.yLblDist.text = SearchModelView.searchAddress(bussiness: self.businesses[indexPath.row])
            cell.yLblDes.text = SearchModelView.searchDistance(bussiness: self.businesses[indexPath.row])
            cell.yLblRating.text = SearchModelView.searchRating(bussiness: self.businesses[indexPath.row])

            return cell
        }
        return UITableViewCell()
    }
}
// MARK: - TableView Delegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(113.0)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.id = (self.businesses[indexPath.row]).ID
            print(vc.id)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
// MARK: - UI
extension ViewController {
    func loadUI() {
        self.tableView.isHidden = true
        contraintsLabel_NoSeEncontraronDatos()
        self.myLabel.isHidden = true
        contraintsActivity()
        //self.myActivity.startAnimating()
        self.searchBar.becomeFirstResponder()
        self.searchBar.delegate = self
    }
    func contraintsLabel_NoSeEncontraronDatos() {
        self.view.addSubview(self.myLabel)
        self.myLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.myLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.myLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.myLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    func contraintsActivity() {
        self.view.addSubview(self.myActivity)
        self.myActivity.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.myActivity.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.myActivity.heightAnchor.constraint(equalToConstant: CGFloat(40.0))
        self.myActivity.widthAnchor.constraint(equalToConstant: CGFloat(40.0))
    }
}
// MARK: - Search Bar
extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        DispatchQueue.global(qos: .background).async {
        
            EndPoint.BusinessSearch("Starbucks", self.latitude ?? NSNumber(), self.longitude ?? NSNumber()) { (tupla) in
                let searchYelpModelRow = tupla.0
                if let searchYelpModel = searchYelpModelRow {
                    self.businesses = searchYelpModel.Businesses
                    
                    if self.businesses.count > 0 {
                        DispatchQueue.main.async {
                            self.myActivity.stopAnimating()
                            self.myActivity.isHidden = true
                            self.tableView.isHidden = false
                            self.tableView.reloadData()
                        }
                    } else {
                        DispatchQueue.main.async {
                            self.myActivity.stopAnimating()
                            self.myActivity.isHidden = true
                            self.myLabel.isHidden = false
                        }
                    }
                } else {
                    print("Error: \(tupla.1)")
                }
            }
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
                self.myActivity.isHidden = false
                self.myActivity.startAnimating()
            }
        }
    }
}
// MARK: - Location
extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        self.latitude = NSNumber.init(value: userLocation.coordinate.latitude)
        self.longitude = NSNumber.init(value: userLocation.coordinate.longitude)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error - Get Location: \(error)")
    }
    func initCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
}
