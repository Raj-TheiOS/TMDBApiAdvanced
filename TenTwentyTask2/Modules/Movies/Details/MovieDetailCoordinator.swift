//
//  MovieDetailCoordinator.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//

import MUIKit

class MovieDetailCoordinator: Coordinator {

    // MARK: - Properties
    var children = [Coordinator]()
    var root: UIViewController!

    weak var parent: Coordinator?

    weak var viewModel: MovieDetailViewModel?

    init(_ controller: UIViewController) {
        self.root = controller
    }

    func start() {
        guard let root = root as? UINavigationController else { return }

        let vc = MovieDetailViewController.instantiate(Module.movies)
        let vm = MovieDetailViewModel(model: MovieModel())
        vm.delegate = self
        vc.viewModel = vm
        viewModel = vm

        if UIDevice.current.userInterfaceIdiom == .pad {
            root.viewControllers = [vc]
        } else {
            root.pushViewController(vc, animated: true)
        }
    }

    // MARK: - Detail operations

    func selectInitialMovie(_ movie: Movie) {
        guard let vm = viewModel else { return }
        if vm.selectedMovie == nil {
            vm.pushNext(movie: movie)
        }
    }

    func reloadMovieDetail(_ movie: Movie) {
        guard let vm = viewModel else { return }
        vm.pushNext(movie: movie)
    }

    func playVideo(_ video: Video) {
        let c = WatchTrailerCoordinator(root, for: video)
        c.parent = self
        c.start()
        children.append(c)
    }
}

extension MovieDetailCoordinator: MovieDetailViewModelDelegate {

    func showTrailer(for video: Video) {
        playVideo(video)
    }

    func viewWillDismiss() {
        parent?.childDidFinish(self)
    }
}
