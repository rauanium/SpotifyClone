//
//  TrackPlayerViewModel.swift
//  Spotify
//
//  Created by rauan on 3/27/24.
//

import Foundation
import AVFoundation

struct TrackPlayerViewModel {
    func getTrackDetails(id: String, completion: @escaping (URL?) -> () ) {
        TrackDetailsManager.shared.getTrackDetails(id: id) { result in
            switch result {
            case .success(let response):
                completion(response.previewURL)
            case .failure(let error):
                print(error)
            }
        }
    }
}
