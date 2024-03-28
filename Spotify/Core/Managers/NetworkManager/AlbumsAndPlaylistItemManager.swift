//
//  AlbumsAndPlaylistItemManager.swift
//  Spotify
//
//  Created by rauan on 3/25/24.
//

import Foundation
import Moya

final class AlbumsAndPlaylistItemManager {
    static let shared = AlbumsAndPlaylistItemManager()
    
    private let provider = MoyaProvider<AlbumAndPlylistItemTarget>(
        plugins: [
            NetworkLoggerPlugin(configuration: NetworkLoggerPluginConfig.prettyLogging),
            LoggerPlugin()
        ]
    )
    
    func getAlbumsItems(id: String, completion: @escaping (APIResult<AlbumDetailsDataModel>) -> Void) {
        provider.request(.getAlbumsItems(id: id)) { result in
            switch result {
                case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(AlbumDetailsDataModel.self, from: response.data)
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
    
    func getPlaylistItems(id: String, completion: @escaping (APIResult<PlaylistDataModel>) -> Void) {
        provider.request(.getPlaylistItems(id: id)) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(PlaylistDataModel.self, from: response.data)
                    DispatchQueue.main.async {
                        completion(.success(decodedData))
                        print("getPlaylistDEtails: \(decodedData)")
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
