//
//  Showable.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import UIKit

protocol Showable {
    func toShowable() -> UIViewController
}

extension UIViewController: Showable {
    public func toShowable() -> UIViewController {
        self
    }
}
