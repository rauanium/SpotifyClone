//
//  AlbumDetailsDataModel.swift
//  Spotify
//
//  Created by rauan on 3/25/24.
//

import Foundation
struct AlbumDetailsDataModel: Codable {
    let albumType: String
    let totalTracks: Int
    let availableMarkets: [String]
    let externalUrls: ExternalUrls
    let href: String
    let id: String
    let images: [AlbumDetailsImage]
    let name, releaseDate, releaseDatePrecision, type: String
    let uri: String
    let artists: [Artist]
    let tracks: AlbumTracks
    let copyrights: [Copyright]
    let externalIDS: ExternalIDS
    let label: String
    let popularity: Int

    enum CodingKeys: String, CodingKey {
        case albumType = "album_type"
        case totalTracks = "total_tracks"
        case availableMarkets = "available_markets"
        case externalUrls = "external_urls"
        case href, id, images, name
        case releaseDate = "release_date"
        case releaseDatePrecision = "release_date_precision"
        case type, uri, artists, tracks, copyrights
        case externalIDS = "external_ids"
        case label, popularity
    }
}

// MARK: - Artist
struct Artist: Codable {
    let externalUrls: ExternalUrls
    let href: String
    let id, name, type, uri: String

    enum CodingKeys: String, CodingKey {
        case externalUrls = "external_urls"
        case href, id, name, type, uri
    }
}

// MARK: - ExternalUrls
struct ExternalUrls: Codable {
    let spotify: String
}

// MARK: - Copyright
struct Copyright: Codable {
    let text, type: String
}

// MARK: - ExternalIDS
struct ExternalIDS: Codable {
    let upc: String
}

// MARK: - Image
struct AlbumDetailsImage: Codable {
    let url: String
    let height, width: Int
}
// MARK: - Tracks
struct AlbumTracks: Codable {
    let href: String
    let limit: Int
    
    let offset: Int
    
    let total: Int
    let items: [AlbumTracksItem]
}

// MARK: - Item
struct AlbumTracksItem: Codable {
    let artists: [Artist]
    let availableMarkets: [String]
    let discNumber, durationMS: Int
    let explicit: Bool
    let externalUrls: ExternalUrls
    let href: String
    let id, name: String
    let previewURL: String
    let trackNumber: Int
    let type, uri: String
    let isLocal: Bool

    enum CodingKeys: String, CodingKey {
        case artists
        case availableMarkets = "available_markets"
        case discNumber = "disc_number"
        case durationMS = "duration_ms"
        case explicit
        case externalUrls = "external_urls"
        case href, id, name
        case previewURL = "preview_url"
        case trackNumber = "track_number"
        case type, uri
        case isLocal = "is_local"
    }
}
