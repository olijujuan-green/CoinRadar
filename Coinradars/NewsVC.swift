//
//  NewsVC.swift
//  Coinradars
//
//  Created by Olijujuan Green on 2022/04/08.
//

import UIKit

class NewsVC: UIViewController {
    
    var articles: [Article] = []
    
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemBackground
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureCollectionView()
        getArticles()
    }
    
    func configureVC() {
        title = "News"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func configureCollectionView()  {
        view.addSubview(collectionView)
        collectionView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell.newsCellId)
    }
    
    func getArticles() {
        NetworkManager.shared.getArticles { result in
            switch result {
            case .success(let newArticles):
                self.articles = newArticles
                for article in newArticles {
                    print(article.title)
                    
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


}

extension NewsVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.newsCellId, for: indexPath) as! NewsCell
        cell.set(article: self.articles[indexPath.row])
        return cell
    }
    
}

