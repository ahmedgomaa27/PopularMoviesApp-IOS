//  MainViewController.swift
//  Movies Demo
//
//  Created by Ahmed Hamdy Gomaa on 4/15/18.
//  Copyright © 2018 Ahmed Hamdy Gomaa. All rights reserved.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var mainTableView: UITableView!
    var movieViewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        movieViewModel.clearImageCache()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return movieViewModel.apiKeyWords.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainTableViewCell
        configureCell(movieCell, at: indexPath)
        return movieCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/2
    }

    private func configureCell(_ cell: MainTableViewCell, at indexPath: IndexPath) {
        let categories = ["Popular", "Top Rated", "Favourites"]
        cell.groupLabel.text = categories[indexPath.section]
        fetchMovies(for: cell, at: indexPath)
    }
    
    private func fetchMovies(for cell: MainTableViewCell, at indexPath: IndexPath) {
        if movieViewModel.moviesList.isEmpty {
            movieViewModel.fetchMovies(sectionNumber: indexPath.section) { error in
                cell.sectionModel.sectionMovieList.append(contentsOf: self.movieViewModel.moviesList[indexPath.section])
                DispatchQueue.main.async {
                    cell.moviesListCollectionView.reloadData()
                }
                if let error = error {
                    print(error)
                }
            }
        }
    }