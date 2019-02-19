//
//  SearchTableViewCell.swift
//  gonetTest
//
//  Created by Gmo Ginppian on 2/18/19.
//  Copyright © 2019 ginppian. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var yImg: UIImageView!
    @IBOutlet weak var yLblTitle: UILabel!
    @IBOutlet weak var yLblDes: UILabel!
    @IBOutlet weak var yLblRating: UILabel!
    @IBOutlet weak var yLblDist: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        yImg.sd_cancelCurrentImageLoad()
        yImg.image = nil
    }
}
