
//ImageHelper.swift
//AsyncTestApp
//
//Created by C4Q on 4/25/18.
//Copyright © 2018 C4Q. All rights reserved.


import Foundation
import UIKit

enum ImageError: Error {
    case badUrl
    case badData
}

class ImageHelper {
    private init(){}
    static let manager = ImageHelper()
    
    func getImage(from imageURL: String,
                  completionHandler: @escaping (UIImage) -> Void,
                  errorHandler: @escaping (Error) -> Void) {
        
        guard let url = URL(string: imageURL) else {
            errorHandler(ImageError.badUrl)
            return
        }
        let completion = {(data: Data) in
            if let onlineImage = UIImage(data: data) {
                completionHandler(onlineImage)
            } else {
                errorHandler(ImageError.badData)
            }
        }
        let request = URLRequest(url: url)
        NetworkHelper.manager.performDataTask(with: request,
                                              completionHandler: completion,
                                              errorHandler: errorHandler)
    }
}
