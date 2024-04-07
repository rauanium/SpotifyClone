//
//  SearchResultsDataModel.swift
//  Spotify
//
//  Created by rauan on 4/3/24.
//

import Foundation

struct SearchResultsDataModel {
    var identifier = UUID()
    
    private enum CodingKeys : String, CodingKey { case id, image, title, arist }
    
    let id: String
    let image: URL?
    let title: String
    let arist: String?
    
}

extension SearchResultsDataModel : Hashable {
    static func == (lhs: SearchResultsDataModel, rhs: SearchResultsDataModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}
