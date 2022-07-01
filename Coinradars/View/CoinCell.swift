//
//  CoinCell.swift
//  Coinradars
//
//  Created by Olijujuan Green on 6/30/22.
//

import UIKit

class CoinCell: UITableViewCell {
    
    static let reuseId = "coinCellId"
    
    let coinimageView: UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = .systemRed
        imgView.layer.cornerRadius = 25
        imgView.backgroundColor = .systemBlue
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let coinSymbolLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "BTC"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let coinNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "Bitcoin"
        label.backgroundColor = .systemRed
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let coinPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.text = "$20,000"
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mktCapLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.text = "$ 387.50 B"
        label.textColor = .systemFill
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViews()  {
        [coinimageView, coinSymbolLabel, coinNameLabel, coinPriceLabel, mktCapLabel].forEach { addSubview($0)}
        
        coinimageView.frame = CGRect(x: 12, y: frame.height / 2 - 10, width: 50, height: 50)
        coinSymbolLabel.frame = CGRect(x: 70, y: 16, width: 100, height: 22)
        coinNameLabel.frame = CGRect(x: 70, y: 40, width: 80, height: 18)
        coinPriceLabel.frame = CGRect(x: 180, y: 24, width: 120, height: 26)
        mktCapLabel.frame = CGRect(x: 300, y: 20, width: 100, height: 26)
    }
    
}
