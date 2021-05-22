//
//  CharactersCell.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import UIKit

class CharactersCell: UITableViewCell {
    // MARK: - Outlets

    @IBOutlet private var characterImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        characterImageView.image = nil
    }
}

// MARK: - CellConfigurable

extension CharactersCell: CellConfigurable {
    func configure(with item: CharacterViewItem) {
        characterImageView.download(image: item.imageURL)
        nameLabel.text = item.name
    }
}
