//
//  MovieDetailsViewModel.swift
//  MovieRxSample
//
//  Created by Ahmed on 5/22/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import RxCocoa

class MovieDetailsViewModel {
    
    private var movieID : Int
    
    
    
    var movieDetail : ReplaySubject<MovieDetailModel> = ReplaySubject.create(bufferSize: 1)
    
    
    
    
    init(moveID : Int) {
        self.movieID = moveID
    }
    

    func getDetailMovies () {

        
        
        let provider = MoyaProvider<MovieAPI>()
        provider.rx.request(.MovieDetail(movieID: movieID)).subscribe { event in
            
            switch event {
            case let .success(response):
                
                do {
                    let decoder = JSONDecoder()
                    let moviesResponse = try decoder.decode(MovieDetailModel.self, from: response.data)

                    
                    self.movieDetail.onNext(moviesResponse)
                    
                    
                }catch {
                    print("error >>> \(error.localizedDescription)")
                }
                
                
            case let .error(error):
                
                print(error)
                
            }
        }
        
        
    }
    
    
}
