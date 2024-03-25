//
//  AlbumAndPlylistItemTarget.swift
//  Spotify
//
//  Created by rauan on 3/25/24.
//

import Foundation
import Moya

enum AlbumAndPlylistItemTarget {
    case getAlbumsItems(id: String)
    case getPlaylistItems(id: String)
}

extension AlbumAndPlylistItemTarget: BaseTargetType {
    var baseURL: URL {
        return URL(string: GlobalConstants.albumsAndPlaylistsBaseURL)!
    }
    var path: String {
        switch self {
        case .getAlbumsItems(let id):
            return "/v1/albums/\(id)"
        case .getPlaylistItems(let id):
            return "/v1/playlists/\(id)"
       
        }
        
    }
    
    var task: Moya.Task {
        switch self {
        case .getAlbumsItems:
            return .requestPlain
        case .getPlaylistItems:
            return .requestPlain
        
        }
    }
    
    var headers: [String : String]? {
        var header = [String: String]()
        AuthManager.shared.withValidToken { token in
            header["Authorization"] = "Bearer \(token)"
        }
        return header
    }
    
}
