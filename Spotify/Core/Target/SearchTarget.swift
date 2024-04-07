//
//  SearchTarget.swift
//  Spotify
//
//  Created by rauan on 4/4/24.
//

import Foundation
import Moya

enum SearchTarget {
    case getSearchedTrack(query: String)
    
}

extension SearchTarget: BaseTargetType {
    var baseURL: URL {
        return URL(string: GlobalConstants.albumsAndPlaylistsBaseURL)!
    }
    
    var path: String {
        switch self {
        case .getSearchedTrack:
            return"/v1/search"
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getSearchedTrack(let query):
            return .requestParameters(parameters: [
                "q" : query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "",
                                                   "limit" : 50,
                                                   "offset" : 0,
                                                   "type" : "track"
                                                   
                                                  ],
                                      encoding: URLEncoding.default)
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
