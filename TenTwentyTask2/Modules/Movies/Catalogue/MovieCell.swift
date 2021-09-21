//
//  MovieCell.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//

import MUIKit
import RxSwift
import RxCocoa
import AlamofireImage

class MovieCell: RxTableCell {

    // MARK: - Outlets
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cntView: UIView!
    
    // MARK: - Fields
    static var reuseIdentifier = "MovieCell"

    // MARK: - Properties
    var viewModel: MovieCellViewModel! {
        didSet {
            viewModel.movie.subscribe(onNext: { [weak self] movie in
                self?.reloadData(movie)
            }).disposed(by: bag)
        }
    }

    override func prepareView() {
        super.prepareView()
        posterView.contentMode = .scaleAspectFill
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        self.posterView.layer.cornerRadius = 5
        cntView.layer.shadowColor = UIColor.gray.cgColor
        cntView.layer.shadowOpacity = 0.3
        cntView.layer.shadowOffset = CGSize.zero
        cntView.layer.shadowRadius = 6
        
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        posterView.image = nil
        titleLabel.text = nil
    }

    func reloadData(_ movie: Movie) {
        titleLabel.text = movie.title
        if let poster = movie.posterURL() {
            posterView.af_setImage(withURL: poster, placeholderImage: UIImage(named: "mozima"))
        }
    }

}
