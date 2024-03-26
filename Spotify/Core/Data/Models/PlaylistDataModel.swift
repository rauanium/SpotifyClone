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
    let duration: Int
    let name: String
    let id: String
    enum CodingKeys: String, CodingKey {
        case artists
        case duration = "duration_ms"
        case name
        case id
    }
}

struct PlaylistArtists: Decodable  {
    let name: String
    let id: String
}

struct PlaylistCoverImage: Decodable {
    let url: String
}

struct Owner: Decodable {
    let displayName: String
    
    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
    }
}
