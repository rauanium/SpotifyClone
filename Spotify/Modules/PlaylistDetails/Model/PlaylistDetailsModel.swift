//
//  PlaylistDetailsModel.swift
//  Spotify
//
//  Created by rauan on 3/22/24.
//

import Foundation

struct PlaylistDetailsModel {
    let playlistImage: URL?
    let playlistName: String
    let description: String
    let artistImage: URL?
    let artistName: String
    let duration: Int
    let totalTracks: Int
}
