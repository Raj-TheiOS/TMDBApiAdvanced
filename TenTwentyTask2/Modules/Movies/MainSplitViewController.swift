//
//  MainSplitViewController.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//


import MUIKit

/// Split ViewController used on iPad only but could be used on any device
class MainSplitViewController: UISplitViewController, Storyboarded {

    // MARK: - Properties
    var catalogue: MovieCatalogueCoordinator!

    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // preferredDisplayMode = .allVisible
        delegate = self

        catalogue = MovieCatalogueCoordinator(viewControllers[0])
        catalogue.start()
        catalogue.prepareMovieDetail(viewControllers[1])
    }

}

extension MainSplitViewController: Alertable {}

// MARK: - Split view

extension MainSplitViewController: UISplitViewControllerDelegate {

    // Do not need this for ipad but kept for reference
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        guard let secondary = secondaryViewController as? UINavigationController else { return false }
        guard let top = secondary.topViewController as? MovieDetailViewController else { return false }
        guard top.viewModel.selectedMovie != nil else {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }

}
