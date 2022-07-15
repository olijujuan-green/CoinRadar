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
    
    func getCoins(completed: @escaping(Result<[Coin], Error>) -> Void) {
        let endpoint = "https://min-api.cryptocompare.com/data/top/mktcapfull?limit=30&tsym=USD"
        guard let url = URL(string: endpoint) else { return }
        var coinsArray = [Coin]()
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completed(.failure(error!))
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
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String: Any]
                let coinData = json["Data"] as! [[String:Any]]
                
                for coin in coinData {
                    
                    let info = coin["CoinInfo"] as! [String: Any]
                    let display = coin["DISPLAY"] as! [String: Any]
                    let usd = display["USD"] as! [String: Any]
                    
                    let symbol = info["Name"] as! String
                    let name = info["FullName"] as! String
                    let price = usd["PRICE"] as! String
                    let changeHour = display["CHANGEPCT24HOUR"] as? String
                    let marketCap = display["MKTCAP"] as? String
                    let imageURL = info["ImageUrl"] as! String
                    
                    let newCoin = Coin(price: price, changePctHour: changeHour, symbol: symbol, name: name, marketCap: marketCap, imageUrl: imageURL)
                    coinsArray.append(newCoin)
                }
                
                                
                completed(.success(coinsArray))
            } catch {
                completed(.failure(error))
            }
        }
        task.resume()
    }
    
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
