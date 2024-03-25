//
//  PlaylistSection.swift
//  Spotify
//
//  Created by rauan on 3/22/24.
//

import Foundation

enum PlaylistSection {
    case general(dataModel: [PlaylistDetailsModel])
    case playlistSongs(dataModel: [PlaylistDetailsModel])
    
//    var items: [PlaylistDataModel] {
//        switch self {
//        case .general(let dataModel),
//                .playlistSongs(let dataModel):
//            return dataModel
//        }
//    }
//    
//    var count: Int {
//        return items.count
//    }
}
