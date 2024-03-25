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
    
    func loadPlaylistDetails() {
        
    }
    
}
