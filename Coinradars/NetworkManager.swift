//
//  NetworkManager.swift
//  Coinradars
//
//  Created by Olijujuan Green on 2022/04/17.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init () {}
    
    func getArticles(completed: @escaping (Result<[Article], Error>) -> Void) {
        let endpoint = "https://min-api.cryptocompare.com/data/v2/news/?lang=EN"
        guard let url = URL(string: endpoint) else { return }
        var articlesArray: [Article] = []
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completed(.failure(error!))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(error!))
                return
            }
            
            guard let data = data else {
                completed(.failure(error!))
                return
            }
            
            do {
                
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:Any]
                let data = json["Data"] as! [[String:Any]]
                
                for article in data {
                    let imageURL = article["imageurl"] as! String
                    let title = article["title"] as! String
                    let sourceName = article["source"] as! String
                    let url = article["url"] as! String
                    
                    let newArticle = Article(imageURl: imageURL, url: url, sourceName: sourceName, title: title)
                    articlesArray.append(newArticle)
                }
                completed(.success(articlesArray))
                
            } catch {
                completed(.failure(error))
            }
            
        }
        task.resume()
    }
    
    
    
    
    
    
}
