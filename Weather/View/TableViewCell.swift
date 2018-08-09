//
//  TableViewCell.swift
//  Weather
//
//  Created by dohien on 08/08/2018.
//  Copyright © 2018 dohien. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var maxtemp_cLabel: UILabel!
    @IBOutlet weak var mintemp_cLabel: UILabel!
    @IBOutlet weak var nameTextField: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
