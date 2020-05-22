//
//  MovieTableViewCell.swift
//  MovieRxSample
//
//  Created by Ahmed on 5/22/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//


import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var lbl_Title: UILabel!
    @IBOutlet weak var lbl_Genre: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
