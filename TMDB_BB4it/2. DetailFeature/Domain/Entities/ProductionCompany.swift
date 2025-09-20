//
//  ProductionCompany.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import Foundation

struct ProductionCompany {
    let id: Int
    let name: String
    let logoURL: URL?
}

extension ProductionCompany {
    init(from model: ProductionCompanyModel) {
        self.id = model.id
        self.name = model.name
        self.logoURL = model.logo_url
    }
}
