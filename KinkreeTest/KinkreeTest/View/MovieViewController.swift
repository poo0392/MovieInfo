//
//  MovieViewController.swift
//  KinkreeTest
//
//  Created by Administrator on 17/03/23.
//

import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    let viewModel = MovieViewModel()
    var searchTextValue:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        viewModel.delegate = self
        viewModel.getMoviesData(input: "\(searchTextValue ?? "")")
        setUIComponents()
    }
    func setUIComponents(){
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        movieCollectionView.setCollectionViewLayout(layout, animated: true)
        
        
        
        
        self.navigationController?.navigationItem.hidesBackButton = true
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
extension MovieViewController : MovieViewModelProtocol {
    func fetchedMovieDetails() {
        DispatchQueue.main.async {
            self.movieCollectionView.reloadData()
        }
    }
}

extension MovieViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCell else {
            return UICollectionViewCell()
        }
        let movie = viewModel.movies[indexPath.row]
        cell.movie = movie
        
        cell.contentView.layer.cornerRadius = 10.0
        cell.contentView.layer.masksToBounds = true
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfSections section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = viewModel.movies[indexPath.row]
        let vc = storyboardMain.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        vc.searchByID = "\(movie.imdbID ?? "")"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)//here your custom value for spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
        
        return CGSize(width:widthPerItem, height: widthPerItem + 100)
    }
    
}

