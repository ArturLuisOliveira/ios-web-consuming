//
//  MoviesPlayingNowResponse.swift
//  web-consuming
//
//  Created by Artur Luis on 02/07/21.
//

import Foundation

struct MoviesPlayingNowResponse: Codable  {
    struct Dates: Codable {
        var maximum: String
        var minimum: String
    }
    var dates: Dates
    var page: Int
    var results: [MovieResponse]
    var total_pages: Int
    var total_results: Int
}
