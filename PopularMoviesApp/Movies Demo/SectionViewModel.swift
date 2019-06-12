//
//  SectionViewModel.swift
//  Movies Demo
//
//  Created by Ahmed Hamdy Gomaa on 2/10/19.
//  Copyright © 2019 Ahmed Hamdy Gomaa. All rights reserved.
//

import Foundation
class SectionViewModel {

    var sectionMovieList : [Movie] = []
    func setupMovieImage(index: Int,cell: MoviesListCollectionViewCell)  {
        if !sectionMovieList.isEmpty {
            let base_url = "http://image.tmdb.org/t/p/original/"
            let movie  = sectionMovieList[index]
            let imageUrlString = base_url + movie.poster_path!
            let imageUrl = URL.init(string: imageUrlString)
            guard let url = imageUrl else {
                return
            }
            cell.movieImage.kf.setImage(with: url, placeholder: nil,
                                        options: [.memoryCacheExpiration(.never)],
                                        progressBlock: nil) { (result) in
                                            cell.indicator?.stopAnimating()
            }
        }
    }
}
