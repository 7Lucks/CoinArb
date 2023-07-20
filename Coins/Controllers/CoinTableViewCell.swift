//
//  CoinTableViewCell.swift
//  Coins
//
//  Created by Дмитрий Игнатьев on 20.07.2023.
//

import UIKit

class CoinTableViewCell: UITableViewCell {
    
    let coinNameLabel = UILabel()
    let coinPriceLabel = UILabel()
    let coinImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
//        NetworkManager.getCoins { coins in
//            // Handle the data received from the server here
//        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(coinImageView)
        contentView.addSubview(coinNameLabel)
        contentView.addSubview(coinPriceLabel)
        
        // Set up constraints for coinImageView
        coinImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            coinImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            coinImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            coinImageView.widthAnchor.constraint(equalToConstant: 50),
            coinImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Set up constraints for coinNameLabel
        coinNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            coinNameLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 10),
            coinNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            coinNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        
        // Set up constraints for coinPriceLabel
        coinPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            coinPriceLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 10),
            coinPriceLabel.topAnchor.constraint(equalTo: coinNameLabel.bottomAnchor, constant: 10),
            coinPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            coinPriceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    
    func configure(with coin: Coin) {
        coinNameLabel.text = coin.name
        coinPriceLabel.text = "\(coin.marketData?.currentPrice?.usd ?? 0)"

        // Fetch and set the coin image
        
//        NetworkManager.getCoinTickers(id: coin.id) { [weak self] tickers in
//            guard let tickers = tickers else { return }
//            let minPrice = tickers.min(by: { $0.last < $1.last })
//            let maxPrice = tickers.max(by: { $0.last < $1.last })
//            DispatchQueue.main.async {
//                self?.coinPriceLabel.text = "Lowest: \(minPrice?.market?.name ?? "") \(minPrice?.last ?? 0) Highest: \(maxPrice?.market?.name ?? "") \(maxPrice?.last ?? 0)"
//            }
//        }
//        coinPriceLabel.text = "\(coin.marketData?.currentPrice?.usd ?? 0)"
//
//        if let urlString = coin.image?.large, let url = URL(string: urlString) {
//            URLSession.shared.dataTask(with: url) { (data, response, error) in
//                if let data = data {
//                    DispatchQueue.main.async {
//                        self.coinImageView.image = UIImage(data: data)
//                    }
//                }
//            }.resume()
//        }
    }
}
