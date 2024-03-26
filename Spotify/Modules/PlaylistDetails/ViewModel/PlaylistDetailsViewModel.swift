//
//  PlaylistDetailsViewModel.swift
//  Spotify
//
//  Created by rauan on 3/22/24.
//

import UIKit

class PlaylistDetailsViewModel {
    private lazy var sections = [PlaylistSection]()
//    static var shared = PlaylistDetailsViewModel()
//    var details: PlaylistSection = {
//        .general(dataModel: [])
//    }()
//    
//    var playlistSongs: PlaylistSection = {
//        .playlistSongs(dataModel: [])
//    }()
    
    var numberOfSections: Int {
        return sections.count
    }
    
    func getSectionViewModel(at section: Int) -> PlaylistSection {
        return sections[section]
    }
    
    func didLoad() {
        sections.append(.general(dataModel: []))
        sections.append(.playlistSongs(dataModel: []))
    }
    
    func loadPlaylistDetails(id: String, completion: @escaping () -> ()) {
        var playlistItems: [PlaylistDetailsModel] = []
        var playlistSongs: [PlaylistSongDetailsDataModel] = []
        var duration = 0
        AlbumsAndPlaylistItemManager.shared.getPlaylistItems(id: id) {[weak self] result in
            switch result {
            case .success(let response):
                
                for index in 0..<response.tracks.total {
                    duration += response.tracks.items[index].track.duration
                    
                }
                
                playlistItems.append(.init(
                    image: response.images.first?.url ?? "",
                    name: response.name,
                    description: response.description,
                    artistImage: response.images.first?.url ?? "",
                    artistName: response.owner.displayName,
                    duration: duration ))
                
                if let index = self?.sections.firstIndex(where: {
                    if case .general = $0 {
                        return true
                    } else {
                        return false
                    }
                }) {
                    self?.sections[index] = .general(dataModel: playlistItems)
                }
                
                response.tracks.items.forEach { song in
                    playlistSongs.append(.init(
                        id: song.track.id,
                        songTitle: song.track.name,
                        songArtist: song.track.artists.first?.name ?? ""))
                }
                
                
                if let index = self?.sections.firstIndex(where: {
                    if case .playlistSongs = $0 {
                        return true
                    } else {
                        return false
                    }
                }) {
                    self?.sections[index] = .playlistSongs(dataModel: playlistSongs)
                }
                
                
                
                
//                self.details = (.general(dataModel: [.init(
//                    image: response.images.first?.url ?? "",
//                    name: response.name,
//                    description: response.description,
//                    artistImage: response.images.first?.url ?? "",
//                    artistName: response.owner.displayName,
//                    duration: response.tracks.first?.track.duration ?? 0)]))
                completion()
            case .failure(let error):
                print(error)
                completion()
            }
        }
        
    }
//    var items: [PlaylistSection] {
//        [details, playlistSongs]
//    }
}
//(
//    image: response.images.first?.url,
//name: response.name,
//description: response.description,
//artistImage: response.images.first?.url,
//artistName: response.owner.displayName,
//duration: response.tracks.first?.track.duration)
