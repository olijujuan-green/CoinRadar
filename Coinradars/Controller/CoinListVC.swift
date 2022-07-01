//
//  CoinListVC.swift
//  Coinradars
//
//  Created by Olijujuan Green on 6/23/22.
//

import UIKit


class CoinListVC: UIViewController {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = 70
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureTableView()
    }
    
    func configureVC() {
        view.backgroundColor = .systemBackground
        title = "Coins"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CoinCell.self, forCellReuseIdentifier: CoinCell.reuseId)
    }
    
    
}


extension CoinListVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CoinCell.reuseId, for: indexPath) as! CoinCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
