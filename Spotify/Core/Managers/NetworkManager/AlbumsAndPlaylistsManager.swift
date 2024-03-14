//
//  AlbumsAndPlaylistsManager.swift
//  Spotify
//
//  Created by rauan on 3/14/24.
//

import Foundation
import Moya

final class AlbumsAndPlaylistsManager {
    static let shared = AlbumsAndPlaylistsManager()
    
    private let provider = MoyaProvider<AlbumsAndPlaylistsTarget>(
        plugins: [
            NetworkLoggerPlugin(configuration: NetworkLoggerPluginConfig.prettyLogging),
            LoggerPlugin()
        ]
    )
    
    func getNewReleases(completion: @escaping (APIResult<[Playlist]>)->Void) {
        provider.request(.getNewReleases) { result in
            switch result {
                case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(NewReleasesModel.self, from: response.data)
                    DispatchQueue.main.async {
                        completion(.success(decodedData.albums.items))
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
    
    func getFeaturedPlaylists(completion: @escaping (APIResult<[PlaylistItems]>) -> Void) {
        provider.request(.featuredPlaylists) { result in
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
            case .failure(_):
                break
            }
        }
    }
    
    func getRecommendations(genres: String, completion: @escaping () -> Void) {
        provider.request(.getRecommendations(genres: genres)) { result in
            switch result {
            case .success(let response):
                break
            case .failure(let error):
                break
            }
        }
    }
    
    func getRecommendedGenre(completion: @escaping (RecommendedGenresModel) -> Void) {
        provider.request(.getRecommendedGenres) { result in
            switch result {
            case .success(let response):
                guard let genres = try? JSONDecoder().decode(RecommendedGenresModel.self, from: response.data) else { return }
                completion(genres)
            case .failure(let error):
                break
            }
        }
    }
}
