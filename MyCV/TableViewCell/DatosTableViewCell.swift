//
//  DatosTableViewCell.swift
//  MyCV
//
//  Created by MIguel Martinez on 8/3/19.
//  Copyright © 2019 Noel MIguel Martinez. All rights reserved.
//

import UIKit

class DatosTableViewCell: UITableViewCell {
    @IBOutlet weak var lblIdeintificador: UILabel!
    @IBOutlet weak var lblValor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
