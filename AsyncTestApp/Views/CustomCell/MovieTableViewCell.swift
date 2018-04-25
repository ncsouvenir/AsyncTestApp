//
//  MovieTableViewCell.swift
//  AsyncTestApp
//
//  Created by C4Q on 4/25/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    //lazy var cell image
    lazy var movieImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "noImg")
        return image
    }()
    
    //initialize with table view cell and reuse iddentifier
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "MovieCell")
        setupGUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupGUI(){
        backgroundColor = .green
        setupViews()
    }
    
    //Autolayout
    func setupViews() {
        //ARRAY MUST BE ON ORDER!!
        let tableViewObjects = [movieImage] as [UIView]
        
        tableViewObjects.forEach{addSubview($0); ($0).translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            //movie image
            movieImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.80),
            movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieImage.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
    
    
  
    
}
