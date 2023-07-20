//
//  CoinListViewController.swift
//  Coins
//
//  Created by Дмитрий Игнатьев on 20.07.2023.
//

import UIKit
import RealmSwift

class CoinListViewController: UITableViewController {
    private var viewModel = CoinListViewModel()
    private var token: NotificationToken?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchCoins()
        tableView.register(CoinTableViewCell.self, forCellReuseIdentifier: Constants.coinCellIdentifier)
        token = viewModel.coins?.observe { [weak self] (changes: RealmCollectionChange) in
            switch changes {
            case .initial:
                self?.tableView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                self?.tableView.beginUpdates()
                self?.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0)}),
                                           with: .automatic)
                self?.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                           with: .automatic)
                self?.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0)}),
                                           with: .automatic)
                self?.tableView.endUpdates()
            case .error(let error):
                fatalError("\(error)")
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.coinCellIdentifier, for: indexPath) as! CoinTableViewCell
        if let coin = viewModel.coin(at: indexPath.row) {
            cell.configure(with: coin)
        }
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.coinDetailSegueIdentifier,
           let coinDetailViewController = segue.destination as? CoinDetailViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            coinDetailViewController.coin = viewModel.coin(at: indexPath.row)
        }
    }
}
