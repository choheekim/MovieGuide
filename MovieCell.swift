//
//  MovieCell.swift
//  MovieGuide
//
//  Created by Chohee Kim on 10/29/16.
//  Copyright © 2016 Chohee Kim. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieCell: UITableViewCell {
    
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var movie: Movie! {
        didSet {
            titleLabel.text = movie.movieTitle
            if(movie.moviePosterUrl != nil) {
                posterImageView.af_setImage(withURL: movie.moviePosterUrl! as URL)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
