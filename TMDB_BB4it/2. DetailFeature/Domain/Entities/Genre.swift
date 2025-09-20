//
//  Genre.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import Foundation

struct Genre {
    let id: Int
    let name: String
}

extension Genre {
    init(from model: GenreModel) {
        self.id = model.id
        self.name = model.name
    }
}
