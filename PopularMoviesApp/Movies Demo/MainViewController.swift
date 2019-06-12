//
//  ViewController.swift
//  Movies Demo
//
//  Created by Ahmed Hamdy Gomaa on 4/15/18.
//  Copyright © 2018 Ahmed Hamdy Gomaa. All rights reserved.
//

import UIKit
import Reachability
import Kingfisher
class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var mainTableView: UITableView!
    var mainModel = MainViewModel()


    override func viewDidLoad() {
        super.viewDidLoad()
        if Reachability()?.connection != Reachability.Connection.none {
            ImageCache.default.clearMemoryCache()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return mainModel.apiKeyWords.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var tempCell  = MainTableViewCell()
        let categories = ["Popular","Top Rated", "Favourites"]
        tempCell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainTableViewCell
        tempCell.groupLabel.text = categories[indexPath.section]
        if mainModel.moviesList.isEmpty {
            mainModel.fetchMovies(sectionNumber: indexPath.section, complition: { error in
                guard let error = error else {
                    tempCell.sectionModel.sectionMovieList.append(contentsOf: self.mainModel.moviesList[indexPath.section])
                    DispatchQueue.main.async {
                        tempCell.moviesListCollectionView.reloadData()
                    }
                    return
                }
                print(error)
            })
        }
        return tempCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/2
    }
}

