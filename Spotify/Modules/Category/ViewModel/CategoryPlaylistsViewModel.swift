//
//  ViewModel.swift
//  Spotify
//
//  Created by rauan on 4/5/24.
//

import Foundation

struct CategoryPlaylistsViewModel {
    func getCategoryPlaylists(id: String, completion: @escaping ([PlaylistItems]) -> Void) {
        CategoriesManager.shared.getCategoryPlaylists(categoryID: id) { result in
            switch result {
            case .success(let response):
//                print("dinnerResponse: \(response)")
                completion(response)
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}

//dinner
