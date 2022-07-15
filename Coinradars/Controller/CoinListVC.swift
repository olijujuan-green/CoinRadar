//
//  CoinListVC.swift
//  Coinradars
//
//  Created by Olijujuan Green on 6/23/22.
//

import UIKit


class CoinListVC: UIViewController {
    
    var coins = [Coin]()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = 70
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCoins()
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
    
    func getCoins() {
        NetworkManager.shared.getCoins { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let retrievedCoins):
                self.coins = retrievedCoins
            case .failure(let error):
                print("Error:\n\(error.localizedDescription)")
            }
        }
    }
    
    
}


extension CoinListVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CoinCell.reuseId, for: indexPath) as! CoinCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
