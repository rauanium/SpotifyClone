//
//  TrackTarger.swift
//  Spotify
//
//  Created by rauan on 3/27/24.
//

import Foundation
import Moya

enum TrackTarget {
    case getTrackDetails(id: String)
    
}

extension TrackTarget: BaseTargetType {
    var baseURL: URL {
        return URL(string: GlobalConstants.albumsAndPlaylistsBaseURL)!
    }
    
    var path: String {
        switch self {
        case .getTrackDetails(let id):
            return "/v1/tracks/\(id)"
        }
    }
    
    var task: Moya.Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        var header = [String: String]()
        AuthManager.shared.withValidToken { token in
            header["Authorization"] = "Bearer \(token)"
        }
        return header
    }
}
