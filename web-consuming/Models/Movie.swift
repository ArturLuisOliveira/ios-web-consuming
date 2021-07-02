//
//  Music.swift
//  web-consuming
//
//  Created by Artur Luis on 02/07/21.
//

import Foundation

struct Movie {
    var posterPath: String
    var title: String
    var overview: String
    var voteAvarage: Double
    
    init(movieResponse: MovieResponse) {
        posterPath = movieResponse.poster_path
        title = movieResponse.title
        overview = movieResponse.overview
        voteAvarage = movieResponse.vote_average
    }
}
