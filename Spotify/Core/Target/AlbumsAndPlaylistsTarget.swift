//
//  AlbumsAndPlaylistsTarget.swift
//  Spotify
//
//  Created by rauan on 3/14/24.
//

import Foundation
import Moya

enum AlbumsAndPlaylistsTarget {
    case getNewReleases
    case featuredPlaylists
    case getRecommendations(genres: String)
    case getRecommendedGenres
}

extension AlbumsAndPlaylistsTarget: BaseTargetType {
    var baseURL: URL {
        return URL(string: GlobalConstants.albumsAndPlaylistsBaseURL)!
    }
    var path: String {
        switch self {
        case .featuredPlaylists:
            return "/v1/browse/featured-playlists"
        case .getNewReleases:
            return "/v1/browse/new-releases"
        case .getRecommendations:
            return "/v1/recommendations"
        case .getRecommendedGenres:
            return "/v1/recommendations/available-genre-seeds"
        }
        
    }
    
    var task: Moya.Task {
        switch self {
        case .featuredPlaylists:
            return .requestParameters(parameters: ["locale" : "sv_SE",
                                                   "limit" : 5,
                                                   "offset": 0],
                                    encoding: URLEncoding.default)
        case .getNewReleases:
            return .requestParameters(parameters: ["limit" : 10,
                                                   "offset": 0],
                                      encoding: URLEncoding.default)
        case .getRecommendations(let genres):
            return .requestParameters(parameters: ["limit": 10,
                                                "offset": 0,
                                                "seed_genres": genres],
                                      encoding: URLEncoding.default)
        case .getRecommendedGenres:
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
