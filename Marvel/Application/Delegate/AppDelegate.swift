//
//  AppDelegate.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import UIKit

@UIApplicationMain
final class AppDelegate: PluggableApplicationDelegate {
    override func services() -> [ApplicationService] {
        [
            ApplicationCoordinatorService(with: window),
            ThemeApplicationService()
        ]
    }
}
