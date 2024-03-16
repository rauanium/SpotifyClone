//
//  RecommendedModel.swift
//  Spotify
//
//  Created by rauan on 3/14/24.
//

import Foundation

struct RecommendedAlbumsModel: Decodable {
//    let seeds: [Seed]
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


//// MARK: - Seed
//struct Seed: Codable {
//    let afterFilteringSize, afterRelinkingSize: Int
//    let id: String
//    let initialPoolSize: Int
//    let type: String
//}
//
//// MARK: - Track
//struct Track: Codable {
//    let album: RecomendedAlbum
//    let artists: [TrackArtist]
//    let availableMarkets: [String]
//    let discNumber, durationMS: Int
//    let explicit: Bool
//    let externalIDS: ExternalIDS
//    let externalUrls: ExternalUrls
//    let id: String
//    let isPlayable: Bool
//    let linkedFrom: LinkedFrom
//    let name: String
//    let popularity: Int
//    let previewURL: String
//    let trackNumber: Int
//    let type, uri: String
//    let isLocal: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case album, artists
//        case availableMarkets = "available_markets"
//        case discNumber = "disc_number"
//        case durationMS = "duration_ms"
//        case explicit
//        case externalIDS = "external_ids"
//        case externalUrls = "external_urls"
//        case id
//        case isPlayable = "is_playable"
//        case linkedFrom = "linked_from"
//        case name, popularity
//        case previewURL = "preview_url"
//        case trackNumber = "track_number"
//        case type, uri
//        case isLocal = "is_local"
//    }
//}
//
//// MARK: - Album
//struct RecomendedAlbum: Codable {
//    let albumType: String
//    let totalTracks: Int
//    let availableMarkets: [String]
//    let externalUrls: ExternalUrls
//    let id: String
//    let images: [RecomendedImage]
//    let name, releaseDate, releaseDatePrecision: String
//    let type, uri: String
//    let artists: [AlbumArtist]
//
//    enum CodingKeys: String, CodingKey {
//        case albumType = "album_type"
//        case totalTracks = "total_tracks"
//        case availableMarkets = "available_markets"
//        case externalUrls = "external_urls"
//        case id, images, name
//        case releaseDate = "release_date"
//        case releaseDatePrecision = "release_date_precision"
//        case type, uri, artists
//    }
//}
//
//// MARK: - AlbumArtist
//struct AlbumArtist: Codable {
//    let externalUrls: ExternalUrls
//    let id, name, type: String
//    let uri: String
//
//    enum CodingKeys: String, CodingKey {
//        case externalUrls = "external_urls"
//        case id, name, type, uri
//    }
//}
//
//// MARK: - ExternalUrls
//struct ExternalUrls: Codable {
//    let spotify: String
//}
//
//// MARK: - Image
//struct RecomendedImage: Codable {
//    let url: String
//    let height, width: Int
//}
//
//
//// MARK: - TrackArtist
//struct TrackArtist: Codable {
//    let externalUrls: ExternalUrls
//    let genres: [String]
//    let id: String
//    let images: [RecomendedImage]
//    let name: String
//    let popularity: Int
//    let type, uri: String
//
//    enum CodingKeys: String, CodingKey {
//        case externalUrls = "external_urls"
//        case genres, id, images, name, popularity, type, uri
//    }
//}
//
//
//// MARK: - ExternalIDS
//struct ExternalIDS: Codable {
//    let isrc, ean, upc: String
//}
//
//// MARK: - LinkedFrom
//struct LinkedFrom: Codable {
//}
