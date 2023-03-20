//
//  MovieViewModel.swift
//  KinkreeTest
//
//  Created by Administrator on 17/03/23.
//

import UIKit

protocol MovieViewModelProtocol {
    func fetchedMovieDetails()
}

class MovieViewModel {
    var delegate:MovieViewModelProtocol?
    
    var movies : [SearchModel] = []
    
    func getMoviesData(input: String){//(self.searchBar.text ?? "")
        Service.sharedInstance.getMoviesByInput(searchText: input) { response, error in
            self.movies = response?.search ?? []
            self.delegate?.fetchedMovieDetails()
            
        }
    }
}
