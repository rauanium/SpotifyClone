//
//  PlaylistDataModel.swift
//  Spotify
//
//  Created by rauan on 3/22/24.
//

import Foundation
struct PlaylistDataModel: Decodable {
    let description: String
    let id: String
    let images: [PlaylistCoverImage]
    let name: String
    let owner: Owner
    let tracks: PlaylistDetailItems
}

struct PlaylistDetailItems: Decodable  {
    let items: [PlaylistTrack]
    let total: Int
}

struct PlaylistTrack: Decodable  {
    let track: PlaylistTrackItemDetails
}

struct PlaylistTrackItemDetails: Decodable {
    let artists: [PlaylistArtists]
    let album: PlaylistTrackAlbum
    let duration: Int
    let name: String
    let id: String
    enum CodingKeys: String, CodingKey {
        case artists
        case duration = "duration_ms"
        case name
        case id
        case album
    }
}

struct PlaylistArtists: Decodable  {
    let name: String
    let id: String
}

struct PlaylistTrackAlbum: Decodable {
    let images: [PlaylistCoverImage]
}

struct PlaylistCoverImage: Decodable {
    let url: URL?
}

struct Owner: Decodable {
    let displayName: String
    
    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
    }
}
