//
//  SearchedTrackModel.swift
//  Spotify
//
//  Created by rauan on 4/1/24.
//

import Foundation

struct SearchedTrackModel: Codable {
    let tracks: SearchedTracks
}

struct SearchedTracks: Codable {
    let items: [SearchedTrackItem]
}

struct SearchedTrackItem: Codable {
    let album: SearchedTrackAlbum
    let artists: [SearchedTrackArtist]
    let id: String
    let name: String
}

struct SearchedTrackAlbum: Codable {
    let id: String
    let images: [SearchedTrackImage]
    let name: String
    let artists: [Artist]
}

struct SearchedTrackArtist: Codable {
    let id, name: String
}

struct SearchedTrackImage: Codable {
    let url: URL?
}

//{
//  "tracks": {
//    "total": 630,
//    "items": [
//      {
//        "album": {
//          "id": "20r762YmB5HeofjMCiPMLv",
//          "images": [
//            {
//              "url": "https://i.scdn.co/image/ab67616d0000b273d9194aa18fa4c9362b47464f",
//              "height": 640,
//              "width": 640
//            },
//            {
//              "url": "https://i.scdn.co/image/ab67616d00001e02d9194aa18fa4c9362b47464f",
//              "height": 300,
//              "width": 300
//            },
//            {
//              "url": "https://i.scdn.co/image/ab67616d00004851d9194aa18fa4c9362b47464f",
//              "height": 64,
//              "width": 64
//            }
//          ],
//          "name": "My Beautiful Dark Twisted Fantasy",
//
//          "artists": [
//            {
//
//              "id": "5K4W6rqBFWDnAN6FQUkS6x",
//              "name": "Kanye West",
//              "type": "artist",
//            }
//          ]
//        },
//        "id": "3DK6m7It6Pw857FcQftMds",
//        "name": "Runaway",
//        
//      }
//    ]
//  }
//}
