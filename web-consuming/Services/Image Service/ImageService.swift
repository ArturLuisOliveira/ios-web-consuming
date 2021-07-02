//
//  ImageService.swift
//  web-consuming
//
//  Created by Artur Luis on 02/07/21.
//

import Foundation
import UIKit

struct ImageService {
    
    static func fetchImage(from urlString: String, completionHandler: @escaping (_ data: Data?) -> ()) {
        let session = URLSession.shared
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(urlString)")!
            
        
        //
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "Authorization": API_TOKEN
        ]
        //
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                completionHandler(nil)
            } else {
                completionHandler(data)
            }
        }
            
        dataTask.resume()
    }
    
    static func setImageToImageView(imageView:UIImageView, from: String) {
        fetchImage(from: from) { (imageData) in
            if let data = imageData {
                DispatchQueue.main.async {
                    imageView.image = UIImage(data: data)
                }
            } else {
                print("Error loading image");
            }
        }
    }
    
}
