//
//  PlaylistDetailsViewModel.swift
//  Spotify
//
//  Created by rauan on 3/22/24.
//

import UIKit

class PlaylistDetailsViewModel {
    private lazy var sections = [PlaylistSection]()
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
                    playlistImage: response.images.first?.url,
                    playlistName: response.name,
                    description: response.description,
                    artistImage: response.images.first?.url,
                    artistName: response.tracks.items.first?.track.artists.first?.name ?? "",
                    duration: duration,
                    totalTracks: response.tracks.total))
                
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
                        songArtist: song.track.artists.first?.name ?? "", 
                        coverImage: song.track.album.images.first?.url))
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
                completion()
                
            case .failure(let error):
                print(error)
                completion()
            }
        }
        
    }
}
