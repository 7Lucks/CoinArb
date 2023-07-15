//
//  CryptoTableViewCell.swift
//  Coins
//
//  Created by Дмитрий Игнатьев on 15.07.2023.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {
    
    static let identifier = "CryptoTableViewCell"
    
    // Здесь вы будете добавлять свои пользовательские представления, такие как логотип монеты, название монеты, текущую цену и т.д.
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // Здесь вы будете настраивать свои пользовательские представления и добавлять их в contentView ячейки.
    }
    
    func configure(with model: CoinsDetail) {
        // Здесь вы будете обновлять свои пользовательские представления с информацией из модели.
    }
}

