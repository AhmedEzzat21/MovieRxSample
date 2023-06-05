//
//  MovieDetailsVC.swift
//  MovieRxSample
//
//  Created by Ahmed on 5/22/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher


class MovieDetailsVC: UIViewController {
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var lbl_Title: UILabel!
    @IBOutlet weak var lbl_ReleaseDate: UILabel!
    @IBOutlet weak var lbl_OverView: UILabel!
    
    
    
    var movieDetailsViewModel : MovieDetailsViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieDetailsViewModel.getDetailMovies()
        
        
        
        movieDetailsViewModel.movieDetail.asObserver()
                            .map({$0.title})
                            .bind(to: lbl_Title.rx.text)
                            .disposed(by: disposeBag)
        
        movieDetailsViewModel.movieDetail.asObserver()
                            .map({$0.overview})
                            .bind(to: lbl_OverView.rx.text)
                            .disposed(by: disposeBag)
        
        
        movieDetailsViewModel.movieDetail.asObserver()
                            .map({$0.releaseDate})
                            .bind(to: lbl_ReleaseDate.rx.text)
                            .disposed(by: disposeBag)

        movieDetailsViewModel.movieDetail.asObserver()
                            .map({$0.posterPath})
                            .map({URL.init(string: "https://image.tmdb.org/t/p/w500\($0 ?? "")")})
                            .bind(to: moviePoster.kf.rx.image())
                            .disposed(by: disposeBag)

    }
    

    

}
