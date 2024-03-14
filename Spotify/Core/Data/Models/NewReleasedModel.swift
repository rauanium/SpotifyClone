//
//  NewReleasedModel.swift
//  Spotify
//
//  Created by rauan on 3/14/24.
//

import Foundation
struct NewReleasesModel: Decodable {
    let albums: AlbumsDataModel
}

struct AlbumsDataModel: Decodable {
    let items: [Playlist]
}


struct Playlist: Decodable {
    let id: String?
    let totalTracks: Int?
    let albumType: String?
    let artists: [Artists]
    let availableMarkets: [String]
    let type: String?
    let images: [ImageDataModel]
    let releaseDate: String?
    let externalUrls: [String: String]?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case totalTracks = "total_tracks"
        case albumType = "album_type"
        case artists
        case availableMarkets = "available_markets"
        case type
        case images
        case releaseDate = "release_date"
        case externalUrls = "external_urls"
        case name
    }
}


struct Artists: Decodable {
    let id: String?
    let externalUrls: [String: String]?
    let name: String?
    let type: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case externalUrls = "external_urls"
        case name
        case type
    }
}

struct ImageDataModel: Decodable {
    let url: String
}
