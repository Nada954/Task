//
//  EmptyStateView.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import UIKit

final class EmptyStateView: UIView {
    // MARK: Outlets

    @IBOutlet private var descriptionLabel: UILabel! {
        didSet { descriptionLabel.text = L10n.State.empty }
    }
}
