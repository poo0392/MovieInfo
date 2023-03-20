//
//  MovieCell.swift
//  KinkreeTest
//
//  Created by Administrator on 17/03/23.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var infoBackgroundView: UIView!
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    @IBOutlet weak var movieReleaseYearLabel: UILabel!
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    
    var movie : SearchModel? {
        didSet { // Property Observer
            setMovieData()
        }
    }
    
    
    func setMovieData(){
        
        
        movieTitleLabel.text = "\(movie?.title ?? "")"
        movieReleaseYearLabel.text = "Release Year : \(movie?.year ?? "")"
        movieImageView.setImage(with:"\(movie?.poster ?? "")")
       
       // movieImageView.transform = CGAffineTransform(scaleX: -1, y: 1)
        
    }
}
