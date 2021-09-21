//
//  MovieCatalogueViewModel.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//

import MCoreKit
import RxSwift

protocol MovieCatalogueViewModelDelegate: AnyObject {
    func didLoadMovies(_ movies: [Movie])
    func didSelect(_ movie: Movie)
}

class MovieCatalogueViewModel: RxViewModel {

//    enum Event {
//        case reload
//        case selectMovie(_ movie: Movie)
//    }

    // MARK: - Properties
    let model: MovieModel

    let movies = PublishSubject<[Movie]>()
    let errors = PublishSubject<Error>()
    let filter = PublishSubject<String?>()

    weak var delegate: MovieCatalogueViewModelDelegate?

    // MARK: - Methods
    init(model: MovieModel) {
        self.model = model
        super.init()
    }

    override func prepare() {
        super.prepare()

        filter.subscribe(onNext: { [unowned self] str in
            let movies = self.model.fetchPopularFromStore(filter: str)
            self.movies.onNext(movies)
        }).disposed(by: bag)
    }

    func fetch() {
        model.fetchPopular(onSuccess: { [weak self] movies in
            self?.delegate?.didLoadMovies(movies)
            self?.movies.onNext(movies)
            }, onError: { [weak self] error in
                self?.errors.onNext(error)
        })
    }

    func selectMovie(_ movie: Movie) {
        self.delegate?.didSelect(movie)
    }

}
