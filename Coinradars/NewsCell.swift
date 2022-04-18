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
        imageView.backgroundColor = .systemBlue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let articleTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Some Really long article name going here. Some Really long article name going here"
        label.numberOfLines = 0
        label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
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
        backgroundColor = .systemRed
        
        [articleImageView, articleTitleLabel].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
        
            articleImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            articleImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            articleImageView.topAnchor.constraint(equalTo: topAnchor),
            articleImageView.heightAnchor.constraint(equalToConstant: 200),
            
            articleTitleLabel.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: 4),
            articleTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            articleTitleLabel.heightAnchor.constraint(equalToConstant: 52),
            articleTitleLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -16)
            
        ])
        
    }
    
    func set(article: Article) {
        
    }
    
}
