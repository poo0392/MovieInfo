//
//  ViewController.swift
//  KinkreeTest
//
//  Created by Administrator on 16/03/23.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUIComponents()
    }
    
    func setupUIComponents()
    {
        self.searchBar.layer.cornerRadius = 20.0
        self.searchBar.clipsToBounds = true
        self.searchBar.delegate = self
        
        
    }
}
extension SearchViewController : UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.text = ""
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if self.searchBar.text == "" {
            print("nothing to search")
        }else {
            self.searchBar.resignFirstResponder()
            let vc = storyboardMain.instantiateViewController(withIdentifier: "MovieViewController") as! MovieViewController
            vc.searchTextValue = self.searchBar.text
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}
