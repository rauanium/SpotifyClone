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
    let tracks: [PlaylistDetailItems]
}

struct PlaylistDetailItems: Decodable  {
    let track: PlaylistTrack
}

struct PlaylistTrack: Decodable  {
    let artists: PlaylistArtists
    let duration: Int
    let name: String
    let id: String
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
}
