//
//  MainTableViewCell.swift
//  Movies Demo
//
//  Created by Ahmed Hamdy Gomaa on 4/15/18.
//  Copyright © 2018 Ahmed Hamdy Gomaa. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell ,UICollectionViewDataSource,UICollectionViewDelegate{

    @IBOutlet weak var groupLabel: UILabel!
    var sectionModel = SectionViewModel()

    @IBAction func seeAllButton(_ sender: UIButton) {
    }
    

    @IBOutlet weak var moviesListCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionModel.sectionMovieList.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movieCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MoviesListCollectionViewCell

        movieCell.indicator?.startAnimating()
        sectionModel.setupMovieImage(index: indexPath.row, cell: movieCell)

        return movieCell
    }

    

}
