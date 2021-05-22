//
//  CharactersViewController.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import UIKit

final class CharactersViewController: UIViewController {
    // MARK: - Outlets

    @IBOutlet private var tableView: UITableView!

    // MARK: - Properties
  
    private lazy var dataSource = TableDataSource<CharactersCell>(tableView)
    // swiftlint:disable implicitly_unwrapped_optional
    var viewModel: CharactersViewModel!

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadCharecters()
        viewModel.state.bind { [weak self] in self?.dataSource.state = $0 }
        dataSource.pagingHandler = { [weak self] in self?.viewModel.loadCharecters(at: $0) }
        dataSource.didSelectHandler = { [weak self] in self?.viewModel.didSelectRow(at: $0) }
    }
}

// MARK: - Interactions

private extension CharactersViewController {
    @IBAction
    func didTapSearchButtonItem(_ sender: UIBarButtonItem) {
        viewModel.didTapSearch()
    }
}
