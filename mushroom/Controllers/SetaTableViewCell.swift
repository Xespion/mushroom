//
//  SetaTableViewCell.swift
//  mushroom
//
//  Created by Alex on 09/12/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class SetaTableViewCell: UITableViewCell {

    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var nombre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
