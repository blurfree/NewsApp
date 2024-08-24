//
//  NetworkManager.swift
//  NewsApp
//
//  Created by blurfree on 8/24/24.
//

import Foundation

enum NewsType {
    
    case headlines(country: String, category: String)
    case sources(source: String)
    case keywords(keyword: String)
}

final class NetworkManager {
    
    let baseURL: String = "https://newsapi.org/v2/top-headlines?"
    
    func fetchData(newsType: NewsType, completion: @escaping (Data?, Error?) -> Void) {
        
        var url = ""
        
        switch newsType {
            
        case .headlines(let country, let category):     /// Headlines News
            
            url = "\(baseURL)country=\(country)&category=\(category)&apiKey=\(apiKey)"
            
        case .sources(let source):      /// Sources News
            
            url = "\(baseURL)sources=\(source)&apiKey=\(apiKey)"
            
        case .keywords(let keyword):    /// Keywords News
            
            url = "\(baseURL)q=\(keyword)&apiKey=\(apiKey)"
        }
        
        guard let url = URL(string: url) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
         
            if let error = error {
                
                print("Network Error: \(error.localizedDescription)")
                completion(nil, error)
                
            } else if let data = data {
                
                completion(data, nil)
            }
        }
        
        task.resume()
    }
}
