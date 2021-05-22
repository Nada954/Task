//
//  MediaCollectionCell.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import UIKit

final class MediaCollectionCell: UICollectionViewCell {
    // MARK: - Outlets

    @IBOutlet private var comicImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
}

// MARK: - CellConfigurable

extension MediaCollectionCell: CellConfigurable {
    func configure(with item: CharacterDetailsViewItem.MediaItem) {
        nameLabel.text = item.title
        comicImageView.download(image: item.imageURL)
    }
}
