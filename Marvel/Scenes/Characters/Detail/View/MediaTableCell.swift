//
//  MediaTableCell.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import UIKit

final class MediaTableCell: UITableViewCell {
    // MARK: - Outlets

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var collectionView: UICollectionView! {
        didSet { collectionView.register(MediaCollectionCell.self) }
    }

    // MARK: - Properties

    private lazy var dataSource = CollectionDataSource<MediaCollectionCell>(collectionView)
}

// MARK: - CellConfigurable

extension MediaTableCell: CellConfigurable {
    func configure(with item: CharacterDetailsViewItem) {
        titleLabel.text = item.title
        dataSource.state = item.state
    }
}
