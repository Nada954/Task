//
//  Routable.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import UIKit

protocol Routable {
    var navigationController: UINavigationController { get }
    var rootViewController: UIViewController? { get }

    func present(_ module: Showable, animated: Bool)
    func push(_ module: Showable, animated: Bool, completion: (() -> Void)?)
    func pop(animated: Bool)
}
