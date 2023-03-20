//
//  Service.swift
//  KinkreeTest
//
//  Created by Administrator on 16/03/23.
//

import UIKit

class Service {
    
    static let sharedInstance = Service()
    let apikey = Bundle.main.infoDictionary?["API_KEY"] as! String
    private init(){}
    
    func getMoviesByInput(searchText:String, completion: @escaping(MovieModel?,Error?)->(Void)){
      
        let url = "\(Constant.API.base_url)\(apikey)&s=\(searchText)"
        guard let url = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data,response,error in
            
            if let err = error {
                completion(nil, err)
                print("Error: \(err.localizedDescription)")
                return
            }
            
                guard let response = data else{ return }
                
                do{
                    let result = try JSONDecoder().decode(MovieModel.self, from: response)
                    print(result)
                    guard result.totalResults == nil else{
                        completion(result,nil)
                       return
                    }
                   
                }catch {
                    completion(nil, error)
                    print("error : \(error.localizedDescription)")
                }
        }.resume()
        
    }
    
    func getMovieDetailsByID(clickedItemID:String, completion: @escaping([MovieDetailModel]?,Error?)->(Void)){
        
        let url = "\(Constant.API.base_url)\(apikey)&i=\(clickedItemID)"
        guard let url = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data,response,error in
            
            if let err = error {
                completion(nil, err)
                print("Error: \(err.localizedDescription)")
                return
            }
            
                guard let response = data else{ return }
                
                do{
                    
                    
                    
                    var resultArr = [MovieDetailModel]()
                    let result = try JSONDecoder().decode(MovieDetailModel.self, from: response)
                    resultArr.append(result)
                    print(result)
                    guard result.response == nil else{
                        completion(resultArr,nil)
                       return
                    }
                   
                }catch {
                    completion(nil, error)
                    print("error : \(error.localizedDescription)")
                }
        }.resume()
    }
    
}
