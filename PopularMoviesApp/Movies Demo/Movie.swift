//
//  Movie.swift
//  Movies Demo
//
//  Created by Ahmed Hamdy Gomaa on 4/15/18.
//  Copyright © 2018 Ahmed Hamdy Gomaa. All rights reserved.
//

import Foundation


import Foundation

struct Movies : Codable {
    let results : [Movie]
}

struct Movie : Codable {
    
    var title:String?
    var poster_path:String?
    var overview:String?
    var release_date:String?
    var posterImage : Data?
}
