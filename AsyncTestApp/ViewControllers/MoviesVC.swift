//
//  ViewController.swift
//  AsyncTestApp
//
//  Created by C4Q on 4/24/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class MoviesVC: UIViewController {
    
    let movieView = MoviesView()
    var movies = [Movie]() {
        didSet{
            movieView.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        movieView.tableView.delegate = self
        movieView.tableView.dataSource = self
        view.addSubview(movieView)
        configureNavBar()
        loadMovies()
    }
    
    func loadMovies(){
        //Write out completion to connect online data to app data
        let parseDatIntoMovies: ([Movie]) -> Void = {(onlineMovie: [Movie]) in
            self.movies = onlineMovie
        }
        //call API client to grab data from the internet
        MovieAPI.getMovies(completionHandler: parseDatIntoMovies,
                           errorHandler: {print($0)})
    }
    
    func configureNavBar(){
        navigationItem.title = "Movies"
    }
}

extension MoviesVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieTableViewCell else {return UITableViewCell()}
        
        let movie = movies[indexPath.row]
        cell.configureCell(movie: movie)
        return cell
    }
}

extension MoviesVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}


