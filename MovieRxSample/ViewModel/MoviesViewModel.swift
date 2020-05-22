//
//  MoviesViewModel.swift
//  MovieRxSample
//
//  Created by Ahmed on 5/22/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import RxCocoa

class MoviesViewModel {
    
    var moviesList : Variable<[MoviesModel]> = Variable([])
//    let provider: MoyaProvider<MovieAPI>
    func getMovies () {
 
        
        let provider = MoyaProvider<MovieAPI>()
        provider.rx.request(.getMovie).subscribe { event in
            
            switch event {
            case let .success(response):

                do {
                    let decoder = JSONDecoder()
                    let moviesResponse = try decoder.decode(MoviesResponse.self, from: response.data)

                    self.moviesList.value = moviesResponse.results ?? []
                    
                }catch {
                    print("error >>> \(error.localizedDescription)")
                }


            case let .error(error):
                
                print(error)
                
            }
        }

        
    }
}
