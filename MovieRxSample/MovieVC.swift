//
//  MovieVC.swift
//  MovieRxSample
//
//  Created by Ahmed on 5/22/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//


import UIKit
import RxSwift
import RxCocoa
import Kingfisher


class MovieVC: UIViewController {
    @IBOutlet weak var MovieTableView: UITableView!
    var moviesViewModel = MoviesViewModel()
    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieTableView.register(UINib.init(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        moviesViewModel.getMovies()
        MovieTableView.rowHeight = 128
        
        
        moviesViewModel.moviesList
                       .asObservable()
            .bind(to: MovieTableView.rx.items(cellIdentifier: "Cell", cellType: MovieTableViewCell.self)) { (row, element, cell) in
                
                //Configure cell
                if let urlStr = element.posterPath {
                    print(">>>> \(urlStr)")
                    cell.poster.kf.setImage(with: URL.init(string: "https://image.tmdb.org/t/p/w500\(urlStr)")! )
                }
                
                cell.lbl_Title.text = element.title
                cell.lbl_Genre.text = element.overview
                
                cell.selectionStyle = .none
                
        }.disposed(by: disposeBag)
        
        
        MovieTableView.rx
            .modelSelected(MoviesModel.self)
            .subscribe { (selectedMovie) in
                
                let story = UIStoryboard.init(name: "Main", bundle: nil)
                let detailsVC = story.instantiateViewController(withIdentifier: "MovieDetailsVC") as! MovieDetailsVC
                detailsVC.movieDetailsViewModel = MovieDetailsViewModel.init(moveID: selectedMovie.element!.id!)
                self.navigationController?.show(detailsVC, sender: nil)
                //Configure selected Row
                
                
        }.disposed(by: disposeBag)
        
        
        
        
        
    }
    
    
    

}
