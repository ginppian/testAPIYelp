//
//  DetailViewController.swift
//  gonetTest
//
//  Created by Gmo Ginppian on 2/18/19.
//  Copyright © 2019 ginppian. All rights reserved.
//

import UIKit
import SDWebImage

extension DetailViewController {
    func loadUI() {
        self.tableView.isHidden = true
        contraintsLabel_NoSeEncontraronDatos()
        self.myLabel.isHidden = true
        contraintsActivity()
        self.myActivity.startAnimating()
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
class DetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var id = String.Empty
    var bussinessDetail = BusinessDetailsYelpModel()
    
    enum sec: Int {
        case img = 0
        case nam = 1
        case opn = 2
        case url = 3
        case pho = 4
        case adr = 5
    }
    
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
    var myImg: UIImageView = {
        let image = UIImageView(image: UIImage(named: "logo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.global(qos: .background).async {
            EndPoint.BussinessDetails(self.id, completion: { (tupla) in
                let bussinessDetailyelModelRow = tupla.0
                if let bussinessDetailyelModel = bussinessDetailyelModelRow {
                    self.bussinessDetail = bussinessDetailyelModel
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
                        //self.myLabel.text = tupla.1
                        self.myLabel.isHidden = false
                    }
                }
            })
        }
    }
}
extension DetailViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case sec.img.rawValue:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailImgTableViewCell", for: indexPath) as? DetailImgTableViewCell {
                if let url = DetailModelView.detailImg(bussiness: self.bussinessDetail) {
                    cell.myImageView.sd_setImage(with: url, completed: nil)
                }
                return cell
            }
            return UITableViewCell()
        case sec.nam.rawValue:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailDesTableViewCell", for: indexPath) as? DetailDesTableViewCell {
                cell.myLbl.text = DetailModelView.Name.getName(bussiness: self.bussinessDetail)
                return cell
            }
            return UITableViewCell()
        case sec.opn.rawValue:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailDesTableViewCell", for: indexPath) as? DetailDesTableViewCell {
                cell.myLbl.text = DetailModelView.Open.getOpen(bussiness: self.bussinessDetail)
                return cell
            }
            return UITableViewCell()
        case sec.url.rawValue:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailDesTableViewCell", for: indexPath) as? DetailDesTableViewCell {
                cell.myLbl.text = DetailModelView.Url.getURL(bussiness: self.bussinessDetail)
                return cell
            }
            return UITableViewCell()
        case sec.pho.rawValue:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailDesTableViewCell", for: indexPath) as? DetailDesTableViewCell {
                cell.myLbl.text = DetailModelView.Phone.getPhone(bussiness: self.bussinessDetail)
                return cell
            }
            return UITableViewCell()
        case sec.adr.rawValue:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailDesTableViewCell", for: indexPath) as? DetailDesTableViewCell {
                cell.myLbl.text = DetailModelView.Address.getAddress(bussiness: self.bussinessDetail)
                return cell
            }
            return UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case sec.img.rawValue:
            return nil
        case sec.nam.rawValue:
            return DetailModelView.Name.Title()
        case sec.opn.rawValue:
            return DetailModelView.Open.Title()
        case sec.url.rawValue:
            return DetailModelView.Url.Title()
        case sec.pho.rawValue:
            return DetailModelView.Phone.Title()
        case sec.adr.rawValue:
            return DetailModelView.Address.Title()
        default:
            return nil
        }
    }
}
extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case sec.img.rawValue:
            return DetailImgTableViewCell.height
        case sec.nam.rawValue:
            return DetailModelView.Name.height()
        case sec.opn.rawValue:
            return DetailModelView.Open.height()
        case sec.url.rawValue:
            return DetailModelView.Url.height()
        case sec.pho.rawValue:
            return DetailModelView.Phone.height()
        case sec.adr.rawValue:
            return DetailModelView.Address.height()
        default:
            return CGFloat(233)
        }
    }
}

