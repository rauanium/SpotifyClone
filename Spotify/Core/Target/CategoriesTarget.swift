//
//  CategoriesTarget.swift
//  Spotify
//
//  Created by rauan on 4/1/24.
//

import Foundation
import Moya

enum CategoriesTarget {
    case getCategories
    case getSearchedTrack(query: String)
    
}

extension CategoriesTarget: BaseTargetType {
    var baseURL: URL {
        return URL(string: GlobalConstants.albumsAndPlaylistsBaseURL)!
    }
    
    var path: String {
        switch self {
        case .getCategories:
            return "/v1/browse/categories"
        case .getSearchedTrack:
            return"/v1/search"
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getCategories:
            return .requestParameters(parameters: ["limit" : 20,
                                                "offset": 0],
                                    encoding: URLEncoding.default)
        case .getSearchedTrack(let query):
            return .requestParameters(parameters: ["q" : query,
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
