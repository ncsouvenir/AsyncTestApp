//
//  MoviesView.swift
//  AsyncTestApp
//
//  Created by C4Q on 4/25/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class MoviesView: UIView {

//lazy var tableview
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.white
        //create and register cell
        tv.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieCell")
        tv.tableFooterView = UIView(frame: .zero)
        return tv
    }()
    
    //Initialization
    override init(frame: CGRect) {//overriding the parent class's functions
        super.init(frame: UIScreen.main.bounds)
        setUpGUI()
    }
    
    required init?(coder aDecoder: NSCoder) { //now the new initializer required for this uiView
        super.init(coder: aDecoder)
        setUpGUI()
    }
    
    private func setUpGUI() {
        //backgroundColor = .white
        setupAndConstrainObjects()
    }
    
    //
    private func setupAndConstrainObjects(){
        //ARRAY MUST BE ON ORDER!!
        let tableViewObject = [tableView] as [UIView]
        
        tableViewObject.forEach{addSubview($0); ($0).translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
            ])
    }
    


}
