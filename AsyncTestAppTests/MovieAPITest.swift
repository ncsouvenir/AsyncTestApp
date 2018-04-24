//
//  MovieAPITest.swift
//  AsyncTestAppTests
//
//  Created by C4Q on 4/24/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import XCTest
@testable import AsyncTestApp //to have access to the classes created in the app

class MovieAPITest: XCTestCase {
    
    func testMovieAPI(){
        //what we are expecting to get back
        let exp = expectation(description: "movie results received")
        var movieCount = 0
        
        //what we are testing
        MovieAPI.searchMovies(query: "") {(error, data) in
            if let error = error {
                XCTFail("mmovie search error: \(error)")
            } else {
                do{
                    let decoder = JSONDecoder()
                    let results = try decoder.decode(MovieSearch.self, from:  data)
                    movieCount = search.results.count
                    //must have this to know if test attempts to pass
                    exp.fulfill()
                } catch {
                    XCTFail("decoding error: \(error)")
                }
            }
        }
        
        //because this is an async call, we need to have a timeout
        wait(for: [exp], timeout: 10.0)
        
        //checking that the movieCount we are getting back is greater than zero
        XCTAssertGreaterThan(movieCount, 0 , "movie count should be greater than zero")
        
        //checking to make sure Blue Collar COmedy Tour is part of our data
    }
    
    
    func testMovie(){
        //what we are expecting to get back
        let exp = expectation(description: "movie results received")
        var movieCount = 0
        var movieSearch =
            
            //what we are testing
            MovieAPI.searchMovies(query: "") {(error, data) in
                if let error = error {
                    XCTFail("mmovie search error: \(error)")
                } else {
                    do{
                        let decoder = JSONDecoder()
                        let results = try decoder.decode(MovieSearch.self, from:  data)
                        movieCount = search.results.count
                        //must have this to know if test attempts to pass
                        exp.fulfill()
                    } catch {
                        XCTFail("decoding error: \(error)")
                    }
                }
        }
        
        //because this is an async call, we need to have a timeout
        wait(for: [exp], timeout: 10.0)
        
        //checking to make sure Blue Collar Comedy Tour is part of our data
        /*inputs:
         
         expectation to compare to
         string being tested
         failed message
         
         */
        XCTAssertEqual(search.results[0].trackName, "Blue Collar Comedy Tour: One for the Road", "Movie does not exist")
    }
    /*Things you can test for: Edge cases
     
     test data count
     test for sorting
     
     */
}
