//
//  PlaylistSection.swift
//  Spotify
//
//  Created by rauan on 3/22/24.
//

import Foundation

enum PlaylistSection {
    case general(dataModel: [PlaylistDetailsModel])
    case playlistSongs(dataModel: [PlaylistSongDetailsDataModel])
}
