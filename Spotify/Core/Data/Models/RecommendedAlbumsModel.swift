//
//  RecommendedModel.swift
//  Spotify
//
//  Created by rauan on 3/14/24.
//

import Foundation

struct RecommendedAlbumsModel: Decodable {
    let tracks: [Track]
}

struct Track: Decodable  {
    let album: RecomendedAlbumModel
    let id: String
    let name: String
//    let previewURL: String
    
    enum CodingKeys: String, CodingKey {
        case album
        case id
        case name
//        case previewURL = "preview_url"
    }
}

struct RecomendedAlbumModel: Decodable  {
    let id: String
    let images: [RecomendedImage]
    let name: String
    let artists: [RecommendedArtists]
}

struct RecomendedImage: Decodable  {
    let url: URL?
}

struct RecommendedArtists: Decodable {
    let name: String
    let id: String
}
