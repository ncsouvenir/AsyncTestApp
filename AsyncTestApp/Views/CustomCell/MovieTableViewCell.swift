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
        image.contentMode = .scaleAspectFit
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
        backgroundColor = UIColor.gray
        setupViews()
    }
    
    //Autolayout
    func setupViews() {
        //ARRAY MUST BE ON ORDER!!
        let tableViewObjects = [movieImage] as [UIView]
        
        tableViewObjects.forEach{addSubview($0); ($0).translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            //movie image
            movieImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.85),
            movieImage.widthAnchor.constraint(equalTo: widthAnchor),
            movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            ])
    }
    
    public func configureCell(movie: Movie){
        self.movieImage.image = #imageLiteral(resourceName: "noImg")
        let movieImage = movie.artworkUrl100
        
        let parseDataIntoImages: (UIImage) -> Void = {(onlineImage: UIImage) in
            self.movieImage.image = onlineImage
            self.setNeedsLayout()
        }
        ImageHelper.manager.getImage(from: movieImage,
                                     completionHandler: parseDataIntoImages,
                                     errorHandler: {print($0)})
    }
}
