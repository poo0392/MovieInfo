//
//  MovieDetailsViewController.swift
//  KinkreeTest
//
//  Created by Administrator on 20/03/23.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemYearLabel: UILabel!
    
    let viewModel = MovieDetailViewModel()
    var model = [MovieDetailModel]()
    var searchByID:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel.delegate = self
        viewModel.getMovieDetails(input: "\(searchByID ?? "")")
        
        
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MovieDetailsViewController : MovieDetailViewModelProtocol {
    func fetchedMovieDetailedItems() {
        DispatchQueue.main.async {
            let movie = self.viewModel.movieDetails
            self.model = movie
            
            self.itemImageView.setImage(with: "\(self.model[0].poster ?? "")")
            self.itemTitleLabel.text = "\(self.model[0].title ?? "")"
            self.itemYearLabel.text = "Release Year : \(self.model[0].year ?? "")"
        }
    }
   
}
