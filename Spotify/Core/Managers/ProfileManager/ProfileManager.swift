//
//  ProfileManager.swift
//  Spotify
//
//  Created by rauan on 3/1/24.
//

import Foundation
import Moya

final class ProfileManager {
    static let shared = ProfileManager()
    
    private let provider = MoyaProvider<ProfileTargetType>(
        plugins: [
            NetworkLoggerPlugin(configuration: NetworkLoggerPluginConfig.prettyLogging),
            LoggerPlugin()
        ]
    )
    
    func getCurrentUserProfile(completion: @escaping (UserProfileModel)->Void) {
        provider.request(.getProfileInfo) { result in
            switch result {
            case .success(let response):
                do {
                    let res = try JSONDecoder().decode(UserProfileModel.self, from: response.data)
                    DispatchQueue.main.async {
                        completion(res)
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
