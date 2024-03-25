//
//  HomeSectionType.swift
//  Spotify
//
//  Created by rauan on 3/7/24.
//

import Foundation

enum HomeSectionType {
    case newRelseasedAlbums(title: String, datamodel: [AlbumsAndPlaylistsModel])
    case featuredPlaylists(title: String, datamodel: [AlbumsAndPlaylistsModel])
    case recommended(title: String, datamodel: [RecomendedModel])
}

