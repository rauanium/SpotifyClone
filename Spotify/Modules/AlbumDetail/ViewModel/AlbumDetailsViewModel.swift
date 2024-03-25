//
//  AlbumDetailsViewModel.swift
//  Spotify
//
//  Created by rauan on 3/25/24.
//

import Foundation

struct AlbumDetailsViewModel {
    
    func loadAlbumDetails(id: String, completion: @escaping (AlbumDetailsDataModel) -> ()) {
        AlbumsAndPlaylistItemManager.shared.getAlbumsItems(id: id) { result in
            switch result {
            case .success(let response):
                completion(response)
            case .failure(_):
                break
            }
            
        }
    }
}
