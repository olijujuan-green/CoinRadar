//
//  NewsCell.swift
//  Coinradars
//
//  Created by Olijujuan Green on 2022/04/08.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    static let newsCellId = "newsCellId."
    
    let articleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let articleTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sourceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {        
        [articleImageView, articleTitleLabel, sourceLabel].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
        
            articleImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            articleImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            articleImageView.topAnchor.constraint(equalTo: topAnchor),
            articleImageView.heightAnchor.constraint(equalToConstant: 200),
            
            articleTitleLabel.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: 4),
            articleTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            articleTitleLabel.heightAnchor.constraint(equalToConstant: 52),
            articleTitleLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -16),
            
            sourceLabel.topAnchor.constraint(equalTo: articleTitleLabel.bottomAnchor, constant: 8),
            sourceLabel.leadingAnchor.constraint(equalTo: articleTitleLabel.leadingAnchor),
            sourceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            sourceLabel.heightAnchor.constraint(equalToConstant: 18)
            
        ])
        
    }
    
    func set(article: Article) {
        
        guard let url = URL(string: article.imageURl) else { return }
        do {
            let data = try Data(contentsOf: url)
            articleImageView.image = UIImage(data: data)
        } catch {
            
        }
        
        articleTitleLabel.text = article.title
        sourceLabel.text = article.sourceName
    }
    
}
