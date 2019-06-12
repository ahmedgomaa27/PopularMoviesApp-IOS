//
//  MoviesListCollectionViewCell.swift
//  Movies Demo
//
//  Created by Ahmed Hamdy Gomaa on 4/15/18.
//  Copyright © 2018 Ahmed Hamdy Gomaa. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class MoviesListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    var indicator: NVActivityIndicatorView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let indicatorFrame = CGRect(x: 0, y: 0, width: self.frame.width/3, height: self.frame.height/3)
        indicator =  NVActivityIndicatorView(frame:indicatorFrame, color: UIColor.red)
        indicator?.center = self.center
        self.addSubview(indicator!)
    }

}
