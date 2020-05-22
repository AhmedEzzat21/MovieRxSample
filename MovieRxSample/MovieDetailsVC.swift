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
    @IBOutlet weak var lbl_Avarage: UILabel!
    
    @IBOutlet weak var lbl_CountVote: UILabel!
    
    @IBOutlet weak var lbl_OriginalLang: UILabel!
    @IBOutlet weak var lbl_RelaseDate: UILabel!
    
    @IBOutlet weak var lbl_Genre: UILabel!
    
    
    
    var movieDetailsViewModel : MovieDetailsViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieDetailsViewModel.getDetailMovies()
        
        
        
        movieDetailsViewModel.movieDetail.asObserver()
                            .map({$0.voteAverage})
                            .map({"\($0 ?? 0.0)"})
                            .bind(to: lbl_Avarage.rx.text)
                            .disposed(by: disposeBag)
        
        movieDetailsViewModel.movieDetail.asObserver()
                            .map({$0.releaseDate})
                            .bind(to: lbl_RelaseDate.rx.text)
                            .disposed(by: disposeBag)
        
        movieDetailsViewModel.movieDetail.asObserver()
                            .map({$0.originalLanguage})
                            .bind(to: lbl_OriginalLang.rx.text)
                            .disposed(by: disposeBag)
        
        movieDetailsViewModel.movieDetail.asObserver()
                            .map({$0.voteCount})
                            .map({"\($0 ?? 0)"})
                            .bind(to: lbl_CountVote.rx.text)
                            .disposed(by: disposeBag)
        
        
        movieDetailsViewModel.movieDetail.asObserver()
                            .map({$0.posterPath})
                            .map({URL.init(string: "https://image.tmdb.org/t/p/w500\($0 ?? "")")})
                            .bind(to: moviePoster.kf.rx.image())
                            .disposed(by: disposeBag)
        
        
        
        movieDetailsViewModel.movieDetail.asObserver()
                        .map({$0.genres?.map({$0.name ?? ""}).joined(separator: ",") })
                        .bind(to: lbl_Genre.rx.text)
                        .disposed(by: disposeBag)
        

        
        
        
        
        
        
    }
    

    

}
