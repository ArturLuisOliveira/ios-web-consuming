//
//  Movies.controller.swift
//  web-consuming
//
//  Created by Artur Luis on 01/07/21.
//

import Foundation

struct MoviesController {
    let view: MoviesViewController
    
    func fetchMovies(type: MovieListType) {
        switch type {
        case .NOW_PLAYING:
            MovieAPI.list(by: .NOW_PLAYING) { movies in
                view.moviesPlayingNow = movies
                view.reload()
            }
        case .POPULAR:
            MovieAPI.list(by: .POPULAR) { movies in
                view.popularMovies = movies
                view.reload()
            }
        }
    }
}
