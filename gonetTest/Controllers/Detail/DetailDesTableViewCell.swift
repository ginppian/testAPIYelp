//
//  DetailDesTableViewCell.swift
//  gonetTest
//
//  Created by Gmo Ginppian on 2/19/19.
//  Copyright © 2019 ginppian. All rights reserved.
//

import UIKit

class DetailDesTableViewCell: UITableViewCell {

    @IBOutlet weak var myLbl: UILabel!
    //    var myLabel: UILabel  = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = UIColor.darkGray
//        label.text = String.Empty
//        label.font = UIFont(name: "Helvetica-Regular", size: 17)
//        label.numberOfLines = 100
//        label.sizeToFit()
//        label.textAlignment = NSTextAlignment.justified
//        label.backgroundColor = UIColor.red
//        return label
//    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        loadUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
//extension DetailDesTableViewCell {
//    func loadUI() {
//        loadLbl()
//    }
//    func loadLbl() {
//        self.myLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8.0).isActive = true
//        self.myLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8.0).isActive = true
//        self.myLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0.0).isActive = true
//        self.myLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0.0).isActive = true
//    }
//}
