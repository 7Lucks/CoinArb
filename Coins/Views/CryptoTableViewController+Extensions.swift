//
//  CryptoTableViewController.swift
//  
//
//  Created by Дмитрий Игнатьев on 15.07.2023.
//

import UIKit

extension CryptoTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.identifier, for: indexPath) as! CryptoTableViewCell
        let coin = viewModel.item(at: indexPath.row)
        cell.configure(with: coin)
        return cell
    }
}

