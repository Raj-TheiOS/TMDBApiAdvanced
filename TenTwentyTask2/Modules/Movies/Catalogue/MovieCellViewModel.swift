//
//  MovieCellViewModel.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//


import MCoreKit
import RxSwift

class MovieCellViewModel: RxViewModel {

    let movie: BehaviorSubject<Movie>!

    init(movie: Movie) {
        self.movie = BehaviorSubject<Movie>(value: movie)
        super.init()
    }

}
