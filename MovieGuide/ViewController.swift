//
//  ViewController.swift
//  MovieGuide
//
//  Created by Chohee Kim on 10/28/16.
//  Copyright © 2016 Chohee Kim. All rights reserved.
//

import UIKit
import Alamofire


let apiKey = "5f4215f8a50c3d1e545bb81546661f60"

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

      weak var tableView: UITableView!
    
    var movies: [Movie]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        makeAPICall()

    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell

        cell.movie = movies?[indexPath.row]
        
        
        return cell
    }
    
    func makeAPICall() {
        Alamofire.request("https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)", method:.get).responseJSON {
            response in
            
            if let result = response.result.value {
                let JSON = result as! NSDictionary
                
                if let status_code = JSON["status_code"] as? Int {
                    print("ERROR: Unable to hit the API with statuc coode:\(status_code)")
                }else {
                    print("Connection to API successful!")
                    print(JSON["results"] as Any)
                    self.movies = Movie.movies(array: (JSON["results"] as? [NSDictionary])!)
                    self.tableView.reloadData()
                }
                
            }
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        let movie = movies?[indexPath!.row]
        
        let movieDetailController = segue.destination as! MovieDetailController
        
        movieDetailController.movie = movie
        
        
    }



}

