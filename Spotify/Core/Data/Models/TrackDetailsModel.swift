//
//  TrackDetailsModel.swift
//  Spotify
//
//  Created by rauan on 3/27/24.
//

import Foundation

struct TrackDetailsModel: Decodable {
    let id: String
    let previewURL: URL?
    
    enum CodingKeys: String, CodingKey {
        case previewURL = "preview_url"
        case id
    }
}
