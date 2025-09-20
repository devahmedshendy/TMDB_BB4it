//
//  ProductionCompanyModel.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import Foundation

struct ProductionCompanyModel: Decodable {
    let id: Int
    let name: String
    let logo_url: URL?

    enum CodingKeys: CodingKey {
        case id
        case name
        case logo_path
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)

        guard let logo_path = try container.decodeIfPresent(
            String.self,
            forKey: .logo_path
        )
        else {
            self.logo_url = nil
            return
        }

        if let logo_url = URL(
            string: .httpUrl.tmdbProductionLogoUrl + "\(logo_path)"
        ) {
            self.logo_url = logo_url
        } else {
            throw DecodingError.dataCorruptedError(
                forKey: .logo_path,
                in: container,
                debugDescription: .error.URLDecodingFromPath(path: logo_path)
            )
        }
    }
}
