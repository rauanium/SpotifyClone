//
//  CategoriesManager.swift
//  Spotify
//
//  Created by rauan on 4/1/24.
//

import Foundation
import Moya

final class CategoriesManager {
    static let shared = CategoriesManager()
    
    private let provider = MoyaProvider<CategoriesTarget>(
        plugins: [
            NetworkLoggerPlugin(configuration: NetworkLoggerPluginConfig.prettyLogging),
            LoggerPlugin()
        ]
    )
    
    func getCategories(completion: @escaping (APIResult<CategoriesModel>) -> Void) {
        provider.request(.getCategories) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(CategoriesModel.self, from: response.data)
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
    
    func getCategoryPlaylists(categoryID: String, completion: @escaping (APIResult<[PlaylistItems]>) -> Void) {
        provider.request(.getCategoryPlaylists(categoryID: categoryID)) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(FeaturedPlaylistsModel.self, from: response.data)
                    DispatchQueue.main.async {
                        completion(.success(decodedData.playlists.items))
                    }
                }
                catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    
}
