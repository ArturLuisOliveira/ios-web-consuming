//
//  MovieAPI.swift
//  web-consuming
//
//  Created by Artur Luis on 02/07/21.
//

import Foundation

struct MovieAPI {
    
    static func list(by listType: MovieListType, completionHandler: @escaping ([Movie]) -> Void) {
        switch listType {
        case .NOW_PLAYING:
            API.get(path: "https://api.themoviedb.org/3/movie/now_playing") {
                (response:MoviesPlayingNowResponse?) in
                if let response = response {
                    let movies = response.results.map { movieResponse in
                        Movie(movieResponse: movieResponse)
                    }
                    completionHandler(movies)
                }
            }
        case .POPULAR:
            API.get(path: "https://api.themoviedb.org/3/movie/popular") {
                (response:PopularMoviesResponse?) in
                if let response = response {
                    let movies = response.results.map { movieResponse in
                        Movie(movieResponse: movieResponse)
                    }
                    completionHandler(movies)
                }
            }
        }
        
    }
}
