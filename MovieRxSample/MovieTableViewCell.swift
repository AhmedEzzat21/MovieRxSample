//
//  MovieTableViewCell.swift
//  MovieRxSample
//
//  Created by Ahmed on 5/22/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//


import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var lbl_Title: UILabel!
    @IBOutlet weak var lbl_Year: UILabel!
    var itemIndex: Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(result: MoviesModel, index: Int) {
       self.itemIndex = index
        if let urlStr = result.posterPath {
            poster.kf.setImage(with: URL.init(string: "https://image.tmdb.org/t/p/w500\(urlStr)")! )
        }
       lbl_Title.text = result.title
       lbl_Year.text =  result.releaseDate

    }
}
