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
    
    static func getMovies(completionHandler: @escaping ([Movie]) -> Void, errorHandler: @escaping ([Error]) -> Void){
        
        let endpoint = "https://itunes.apple.com/search?media=movie&term=comedy&limit=100"
        
        guard let url = URL(string: endpoint) else {return}
        
        let request = URLRequest(url: url)
        
        let parseDataIntoMovies: (Data) -> Void = {(data) in
            do{
                let decoder = JSONDecoder()
                let results = try decoder.decode(MovieSearch.self, from: data)
                let movies = results.results
                completionHandler(movies)
            }catch{
                print("unable to parse data")
            }
        }
        NetworkHelper.manager.performDataTask(with: request,
                                              completionHandler: parseDataIntoMovies,
                                              errorHandler: {print($0)})
    }
}

