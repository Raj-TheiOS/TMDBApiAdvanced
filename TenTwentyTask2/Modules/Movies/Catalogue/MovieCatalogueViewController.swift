//
//  MovieCatalogueViewController.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//

import MUIKit
import RxSwift
import RxCocoa

/// ViewController for the list of popular movies
class MovieCatalogueViewController: RxTableController, Storyboarded {

    // MARK: - Properties

    /// ViewModel for the list of popular movies
    var viewModel: MovieCatalogueViewModel!

    // MARK: - Private fields

    private var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController?.isCollapsed ?? false
        super.viewWillAppear(animated)
    }

    override func prepareView() {
        super.prepareView()

        title = .MovieCatalogue

        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: .PullToLoad)

        tableView.refreshControl = refreshControl
        tableView.rowHeight = 160.0

        searchController = UISearchController(searchResultsController: nil)
        searchController.dimsBackgroundDuringPresentation = false

        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            // Fallback on earlier versions
            tableView.tableHeaderView = searchController.searchBar
        }
    }

    override func prepareBinding() {
        super.prepareBinding()

        // Generate event for reload
        refreshControl?.rx.controlEvent(.valueChanged)
            .subscribe(onNext: { [unowned self] in
                self.viewModel.fetch()
            }).disposed(by: bag)

        // Search Controller
        searchController.searchBar.rx.text
            .debounce(0.5, scheduler: MainScheduler.instance)
            .bind(to: viewModel.filter).disposed(by: bag)

        // Bind row selection
        tableView.rx.modelSelected(Movie.self).subscribe(onNext: { [unowned self] model in
            self.viewModel.selectMovie(model)
        }).disposed(by: bag)
    }

    override func prepareData() {
        super.prepareData()

        // Hide spinner on response
        viewModel.movies.subscribe(onNext: { [weak self] _ in
            self?.refreshControl?.endRefreshing()
            self?.stopAnimating()
        }).disposed(by: bag)

        // Bind to the tableview
        viewModel.movies.catchErrorJustReturn([])
            .bind(to: tableView.rx.items(cellIdentifier: MovieCell.reuseIdentifier, cellType: MovieCell.self)) { _, movie, cell in
                if let vm = cell.viewModel {
                    vm.movie.onNext(movie)
                } else {
                    cell.viewModel = MovieCellViewModel(movie: movie)
                }
            }.disposed(by: bag)

        // Display error
        viewModel.errors.subscribe(onNext: { [weak self] error in
            self?.refreshControl?.endRefreshing()
            self?.stopAnimating()
            self?.alert(.Movies24i, message: error.localizedDescription)
        }).disposed(by: bag)

        // Load movies on start
        startAnimating()
        viewModel.fetch()
    }

}
