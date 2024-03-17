//
//  MainViewModel.swift
//  Spotify
//
//  Created by rauan on 2/14/24.
//

import UIKit

class HomeViewModel {
    
    private lazy var sections = [HomeSectionType]()
    
    var numberOfSections :Int {
        return sections.count
    }
    
    func getSectionViewModel(at section: Int) -> HomeSectionType {
        return sections[section]
    }
    
    func didLoad() {
        sections.append(.newRelseasedAlbums(title: "New Released Albums", datamodel: []))
        sections.append(.featuredPlaylists(title: "Featured Playlists", datamodel: []))
        sections.append(.recommended(title: "Recommended", datamodel: []))
    }
    
    func loadFeaturedPlaylists(completion: @escaping() -> ()) {
        var featuredPlaylists: [AlbumsAndPlaylistsModel] = []
        
        AlbumsAndPlaylistsManager.shared.getFeaturedPlaylists { [weak self] result in
            switch result {
            case .success(let response):
                response.forEach {
                    featuredPlaylists.append( .init(coverImage: $0.images.first?.url, coverTitle: $0.name))
                }
                if let index = self?.sections.firstIndex(where: {
                    if case .featuredPlaylists = $0 {
                        return true
                    } else {
                        return false
                    }
                }) {
                    self?.sections[index] = .featuredPlaylists(title: "Featured Playlists", datamodel: featuredPlaylists)
                }
                completion()
            case .failure(_):
                completion()
                break
            }
        }
        
    }
    
    func loadNewReleasedAlbums(completion: @escaping () -> ()) {
        var albums: [AlbumsAndPlaylistsModel] = []
        
        AlbumsAndPlaylistsManager.shared.getNewReleases { [weak self] result in
            switch result {
            case .success(let response):
                response.forEach {
                    albums.append( .init(coverImage: $0.images.first?.url, coverTitle: $0.name))
                }
                if let index = self?.sections.firstIndex(where: {
                    if case .newRelseasedAlbums = $0 {
                        return true
                    } else {
                        return false
                    }
                }) {
                    self?.sections[index] = .newRelseasedAlbums(title: "New Released Albums", datamodel: albums)
                }
                completion()
            case .failure(_):
                completion()
                break
            }
        }
        
    }
    
    func loadRecomended(completion: @escaping() -> ()) {
        var recommended: [RecomendedModel] = []
        AlbumsAndPlaylistsManager.shared.getRecommendedGenre { genre in
            var genresCollection = Set<String>()
            while genresCollection.count < 5 {
                if let random = genre.genres.randomElement() {
                    genresCollection.insert(random)
                }
            }
            
            let genres = genresCollection.joined(separator: ",")
//            completion()
            AlbumsAndPlaylistsManager.shared.getRecommendations(genres: genres) { [weak self] result in
                switch result {
                case .success(let response):
                    print("response \(response)")
                    response.forEach { track in
                        recommended.append(.init(coverImage: track.album.images.first?.url,
                                                 coverTitle: track.album.name,
                                                 coverSubtitle: track.album.artists.first?.name))
                    }
                    if let index = self?.sections.firstIndex(where: {
                        if case .recommended = $0 {
                            return true
                        } else {
                            return false
                        }
                    }) {
                        self?.sections[index] = .recommended(title: "Recommended", datamodel: recommended)
                    }
                    
                    completion()
                case .failure(let error):
                    print("error: \(error)")
                    completion()
                }
            }
            
            print("loadRecommended: \(recommended)")
        }
    }
    
}
