//
//  Movie.swift
//  MovieGuide
//
//  Created by Chohee Kim on 11/2/16.
//  Copyright © 2016 Chohee Kim. All rights reserved.
//

import UIKit

let baseImageURL = "https://image.tmdb.org/t/p/w500"

class Movie: NSObject {

    var moviePosterUrl: NSURL?
    var movieTitle: String?
    var movieOverview: String?
    var movieBackdropPathUrl: NSURL?
    
    init(dictionary : NSDictionary) {
        
        if let moviePosterUrlString = dictionary["poster_path"] as? String {
            moviePosterUrl = NSURL(string: baseImageURL + moviePosterUrlString)!
        }else {
            moviePosterUrl = nil
        }
        
        if let movieBackdropPathUrlString = dictionary["backdrop_path"] as? String {
            movieBackdropPathUrl = NSURL(string: baseImageURL + movieBackdropPathUrlString)!
        }else {
            movieBackdropPathUrl = nil
        }
        
        self.movieTitle = dictionary["movie_title"] as? String
        self.movieOverview = dictionary["overview"] as? String
    }
    
    class func movies(array: [NSDictionary]) -> [Movie] {
        
        var movies = [Movie]()
        
        for element in array {
            
            let movie = Movie(dictionary: element)
            movies.append(movie)
        
        }
      
        return movies
    }
    
}
