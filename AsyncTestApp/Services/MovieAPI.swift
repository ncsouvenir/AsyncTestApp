//
//  MovieAPI.swift
//  AsyncTestApp
//
//  Created by C4Q on 4/24/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

struct MovieAPI {
    //getting access to the outside world
    static let urlSession = URLSession(configuration: .default)
    static let urlRequest = URLRequest(url: URL(string: "https://itunes.apple.com/search?media=movie&term=comedy&limit=10")!)
    
    
    static func searchMovies(query: String, completion: @escaping (Error?, Data?) -> Void){
        urlSession.dataTask(with: urlRequest) {(data, response, error) in
            if let error = error {
                completion(error, nil)
            } else if let data = data {
                completion(nil, data)
            }
            }.resume()
    }
}

