//
//  AudioManager.swift
//  Spotify
//
//  Created by rauan on 3/30/24.
//

import Foundation
import AVFoundation

class AudioManager {
    static let shared = AudioManager()
    var player: AVPlayer?
    var playlist: [URL] = []
    var trackID: String = ""
    
    func playAudioFromURLs(urls: [URL]) {
        playlist = urls
        
        playNextAudio()
    }
    
    func playNextAudio() {
        guard let url = playlist.first else {
            print("playlist empty")
            return
        }
        
        
        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        player?.play()
        
    }
    
    func stopAudio() {
        player?.pause()
    }
    
    func playAudio() {
        player?.play()
    }
}
