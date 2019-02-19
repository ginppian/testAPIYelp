//
//  DetailImgTableViewCell.swift
//  gonetTest
//
//  Created by Gmo Ginppian on 2/19/19.
//  Copyright © 2019 ginppian. All rights reserved.
//

import UIKit

class DetailImgTableViewCell: UITableViewCell {

    public static let height = CGFloat(233)
    lazy var myImageView = UIImageView(frame: self.frame)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension DetailImgTableViewCell {
    func loadUI() {
        loadImageView()
    }
    func loadImageView() {
        self.myImageView.image = UIImage(named: "logo")
        self.myImageView.contentMode = .scaleAspectFit
        self.myImageView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(myImageView)
        
        self.myImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0).isActive = true
        self.myImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0.0).isActive = true
        self.myImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0.0).isActive = true
        self.myImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0.0).isActive = true
    }
}
