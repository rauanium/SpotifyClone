//
//  FeaturedPlaylistsModel.swift
//  Spotify
//
//  Created by rauan on 3/14/24.
//

import Foundation
struct FeaturedPlaylistsModel: Decodable {
    let playlists: Playlists
}

struct Playlists: Decodable {
    let items: [PlaylistItems]
    
}
struct PlaylistItems: Decodable {
    let images: [PlaylistImages]
    let name: String
}

struct PlaylistImages: Decodable {
    let url: String
}
