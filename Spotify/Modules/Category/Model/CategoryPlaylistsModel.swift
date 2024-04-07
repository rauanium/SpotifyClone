//
//  CategoryPlaylistsModel.swift
//  Spotify
//
//  Created by rauan on 4/5/24.
//

import Foundation

struct CategoryPlaylistsModel {
    var identifier = UUID()
    
    private enum CodingKeys: String, CodingKey {
        case title
    }
    let id: String
    let image: String
    let title: String
}

extension CategoryPlaylistsModel : Hashable {
    static func == (lhs: CategoryPlaylistsModel, rhs: CategoryPlaylistsModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}
