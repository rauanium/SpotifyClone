//
//  TrackDetailsManager.swift
//  Spotify
//
//  Created by rauan on 3/27/24.
//

import Foundation
import Moya

final class TrackDetailsManager {
    static let shared = TrackDetailsManager()
    
    private let provider = MoyaProvider<TrackTarget>(
        plugins: [
            NetworkLoggerPlugin(configuration: NetworkLoggerPluginConfig.prettyLogging),
            LoggerPlugin()
        ]
    )
    
    func getTrackDetails(id: String, completion: @escaping (APIResult<TrackDetailsModel>) -> Void) {
        provider.request(.getTrackDetails(id: id)) { result in
            switch result {
                case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(TrackDetailsModel.self, from: response.data)
                    DispatchQueue.main.async {
                        completion(.success(decodedData))
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
