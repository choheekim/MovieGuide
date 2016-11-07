//
//  MovieDetailController.swift
//  MovieGuide
//
//  Created by Chohee Kim on 11/6/16.
//  Copyright © 2016 Chohee Kim. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    
    var movie : Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = movie?.movieTitle
        self.overviewLabel.text = movie?.movieOverview
        
        if(movie?.movieBackdropPathUrl != nil) {
            backgroundImageView.af_setImage(withURL: (movie?.movieBackdropPathUrl)! as URL)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
