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
    
    //test if data is coming back from network call
    func testMovieAPI(){
        //what we are expecting to get back
        let exp = expectation(description: "movie results received")
        var movieCount = 0
        
        //what we are testing
        MovieAPI.searchMovies(query: "") {(error, data) in
            if let error = error {
                XCTFail("mmovie search error: \(error)")
            } else if let data = data {
                do{
                    let decoder = JSONDecoder()
                    let results = try decoder.decode(MovieSearch.self, from:  data)
                    movieCount = results.results.count
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
    
    
    //making sure you have a certain movie
    func testMovie(){
        //what we are expecting to get back
        let exp = expectation(description: "movie results received")
        var results: MovieSearch!
            
            //what we are testing
            MovieAPI.searchMovies(query: "") {(error, data) in
                if let error = error {
                    XCTFail("mmovie search error: \(error)")
                } else if let data = data {
                    do{
                        let decoder = JSONDecoder()
                        results = try decoder.decode(MovieSearch.self, from:  data)
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
        XCTAssertEqual(results.results[0].trackName, "Blue Collar Comedy Tour: One for the Road", "Movie does not exist")
    }
    
    /*Things you can test for: Edge cases
     
     test data count
     test for sorting
     
     */
    
    //Tessting to make sure that all of the movies coming in are Unrated only
    func testOnlyReturnUnratedMovies(){
        let exp = expectation(description: "Only unrated movies are showing")
        var results: MovieSearch!
        
        //what we are testing
        MovieAPI.searchMovies(query: "") {(error, data) in
            if let error = error {
                XCTFail("mmovie search error: \(error)")
            } else if let data = data {
                do{
                    let decoder = JSONDecoder()
                    results = try decoder.decode(MovieSearch.self, from:  data)
                    //must have this to know if test attempts to pass
                    exp.fulfill()
                } catch {
                    XCTFail("decoding error: \(error)")
                }
            }
        }
         wait(for: [exp], timeout: 10.0)
        //XCTAssertEqual(results.results[0]., "Blue Collar Comedy Tour: One for the Road", "Movie does not exist")
        XCTAssertEqual(results.results[0].contentAdvisoryRating, "Unrated", "Movie is not unrated")
        
    }
}
