//
//  MovieDetailViewModel.swift
//  KinkreeTest
//
//  Created by Administrator on 20/03/23.
//
import UIKit

protocol MovieDetailViewModelProtocol {
    func fetchedMovieDetailedItems()
}

class MovieDetailViewModel {
    var delegate:MovieDetailViewModelProtocol?
    var movieDetails = [MovieDetailModel]()
   
    
    func getMovieDetails(input: String){
        Service.sharedInstance.getMovieDetailsByID(clickedItemID: input) { result, error in
            print(result)
            self.movieDetails = result ?? []
            self.delegate?.fetchedMovieDetailedItems()
        }
    }
}
