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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        // add delegates
        movieView.tableView.delegate = self
        movieView.tableView.dataSource = self
        view.addSubview(movieView)
    }
    
    //load data
    

}


//add extensions
extension MoviesVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieTableViewCell else {return UITableViewCell()}
            
       
        return cell
    }
}


extension MoviesVC: UITableViewDelegate{
    
}


