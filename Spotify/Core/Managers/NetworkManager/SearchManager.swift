//
//  SearchManager.swift
//  Spotify
//
//  Created by rauan on 4/4/24.
//

import Foundation
import Moya

final class SearchManager {
    static let shared = SearchManager()
    
    private let provider = MoyaProvider<SearchTarget>(
        plugins: [
            NetworkLoggerPlugin(configuration: NetworkLoggerPluginConfig.prettyLogging),
            LoggerPlugin()
        ]
    )
    
    func getSearchedTracks(query: String, completion: @escaping (APIResult<[SearchedTrackItem]>) -> () ) {
        provider.request(.getSearchedTrack(query: query)) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(SearchedTrackModel.self, from: response.data)
                    DispatchQueue.main.async {
                        print("decodedData: \(decodedData)")
                        completion(.success(decodedData.tracks.items))
                    }
                }
                catch {
                    print(error)
                }
                
            case .failure(_):
                break
            }
        }
    }
}
