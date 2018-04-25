//
//  MovieModel.swift
//  AsyncTestApp
//
//  Created by C4Q on 4/24/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

struct MovieSearch: Codable{
    let results: [Movie]
}

struct Movie: Codable {
    let trackName: String
    let artistName: String
    let artworkUrl100: String
    let contentAdvisoryRating: String
}
