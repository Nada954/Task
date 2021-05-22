//
//  ApplicationCoordinatorService.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import UIKit

final class ApplicationCoordinatorService: ApplicationService {
    // MARK: - Properties

    private var window: UIWindow?
    private var applicationCoordinator: ApplicationCoordinator?

    // MARK: - Init

    init(with window: UIWindow?) {
        self.window = window
    }

    // MARK: - ApplicationService

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let applicationCoordinator = ApplicationCoordinator(window: window)
        self.window = window
        self.applicationCoordinator = applicationCoordinator
        applicationCoordinator.start()

        return true
    }
}
