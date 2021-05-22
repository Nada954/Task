//
//  UITableView.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_ cell: T.Type) {
        let nib = UINib(nibName: T.reuseIdentifier, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(at indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Error dequeuing cell for identifier \(T.reuseIdentifier)")
        }
        return cell
    }
}
