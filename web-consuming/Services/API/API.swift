//
//  API.swift
//  web-consuming
//
//  Created by Artur Luis on 01/07/21.
//

import Foundation



struct API {
    
    
    static func get<T:Codable>(path: String, completionHandler: @escaping (T?)-> Void) {
        let decoder = JSONDecoder()
        
        let url = URL(string: path)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "Authorization": API_TOKEN
        ]
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if (error != nil) {
                completionHandler(nil)
                return
            }
            
            guard
                let data = data  else {
                print("complete null")
                completionHandler(nil)
                return
            }
            do {
                let recieved = try decoder.decode(T.self, from: data )
                
                print("response \(recieved)")
                completionHandler(recieved)
            } catch {
                print(error)
                completionHandler(nil)
            }
            
        }.resume()
    }
}
