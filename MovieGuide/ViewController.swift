//
//  ViewController.swift
//  MovieGuide
//
//  Created by Chohee Kim on 10/28/16.
//  Copyright © 2016 Chohee Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell

        cell.titleLabel.text = "Les miserables"
        cell.posterImageView.image = UIImage(named: "Les-miserables-movie-poster")
        
        
        return cell
    }



}

