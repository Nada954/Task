//
//  ReusableView.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import UIKit

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}

extension UITableViewCell: ReusableView {}

extension UICollectionViewCell: ReusableView {}
