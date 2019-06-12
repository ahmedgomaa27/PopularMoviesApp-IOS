//
//  MainViewModel.swift
//  Movies Demo
//
//  Created by Ahmed Hamdy Gomaa on 4/15/18.
//  Copyright © 2018 Ahmed Hamdy Gomaa. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class MainViewModel {

    var moviesList = [[Movie]]()
    let apiKeyWords = ["popular","top_rated"]
    let API_KEY = moviesAPI


    func fetchMovies(sectionNumber: Int,complition: @escaping (_ error: String? )->())  {

        let type = apiKeyWords[sectionNumber]
        let url = URL.init(string: "https://api.themoviedb.org/3/movie/" + type + "?api_key=" + API_KEY)!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do{
                let jsonDecoder = JSONDecoder()
                if let data = data {
                    let mappedArray = try jsonDecoder.decode(Movies.self, from: data)
                    self.moviesList.append(mappedArray.results)
                    complition(nil)
                } else {
                    complition("error fetching data")
                }
            } catch let error{
                print(error)
            }
            }.resume()

    }
}
