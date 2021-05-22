//
//  StoryboardIdentifiable.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import UIKit

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        String(describing: self)
    }

    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let identifier = "\(self)"
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? Self else {
            fatalError("Couldn't instantiate view controller with identifier \(identifier) ")
        }
        return viewController
    }
}

extension UIViewController: StoryboardIdentifiable {}
