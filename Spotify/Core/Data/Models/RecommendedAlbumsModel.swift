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
}

struct RecomendedAlbumModel: Decodable  {
    let id: String
    let images: [RecomendedImage]
    let name: String
    let artists: [RecommendedArtists]
}

struct RecomendedImage: Decodable  {
    let url: String
}

struct RecommendedArtists: Decodable {
    let name: String
    let id: String
}
