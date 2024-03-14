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
                break
            }
        }
        
    }
    
    func loadRecomended(completion: () -> ()) {
        let recommended: [RecomendedModel] = []
        AlbumsAndPlaylistsManager.shared.getRecommendedGenre { genre in
            var genresCollection = Set<String>()
            while genresCollection.count < 5 {
                if let random = genre.genres.randomElement() {
                    genresCollection.insert(random)
                }
            }
            
            let genres = genresCollection.joined(separator: ",")
            AlbumsAndPlaylistsManager.shared.getRecommendations(genres: genres) {
                
            }
            
            
        }
          
        if let index = sections.firstIndex(where: {
            if case .recommended = $0 {
                return true
            } else {
                return false
            }
        }) {
//            sections[index] = .recommended(title: "Recommended", datamodel: recommended)
        }
        
        completion()
    }
    
//    func loadData(completion: ([HomeSectionType]) -> ()) {
//        sections.append(.newRelseasedAlbums(datamodel: [
//            .init(coverImage: UIImage(named: "cover1")!, coverTitle: "Anand Bakshi: The Lyricist Who Made…"),
//            .init(coverImage: UIImage(named: "cover2")!, coverTitle: "E123: Sankar Bora (Co-founder & CO…"),
//            .init(coverImage: UIImage(named: "cover3")!, coverTitle: "Hymn for the Weekend"),
//            .init(coverImage: UIImage(named: "cover4")!, coverTitle: "Something Just Like This"),
//            .init(coverImage: UIImage(named: "cover5")!, coverTitle: "A Rush of Blood to the Head"),
//        ]))
//        sections.append(.featuredPlaylists(datamodel: [
//            .init(coverImage: UIImage(named: "cover3")!, coverTitle: "Hymn for the Weekend"),
//            .init(coverImage: UIImage(named: "cover4")!, coverTitle: "Something Just Like This"),
//            .init(coverImage: UIImage(named: "cover5")!, coverTitle: "A Rush of Blood to the Head"),
//            .init(coverImage: UIImage(named: "cover1")!, coverTitle: "Anand Bakshi: The Lyricist Who Made…"),
//            .init(coverImage: UIImage(named: "cover2")!, coverTitle: "E123: Sankar Bora (Co-founder & CO…"),
//
//        ]))
//        sections.append(.recommended(datamodel: [
//            .init(coverImage: UIImage(named: "cover5")!, coverTitle: "Cozy Coffeehouse", coverSubtitle: nil),
//            .init(coverImage: UIImage(named: "cover4")!, coverTitle: "Cozy", coverSubtitle: "Profile"),
//            .init(coverImage: UIImage(named: "cover3")!, coverTitle: "Cozy Clouds", coverSubtitle: nil),
//            .init(coverImage: UIImage(named: "cover2")!, coverTitle: "Kanye West", coverSubtitle: "Dark Fantasy"),
//            .init(coverImage: UIImage(named: "cover1")!, coverTitle: "Basta", coverSubtitle: "Basta 2")
//        ]))
//
//        completion(sections)
//
//
//    }
    
    
    
    
}
