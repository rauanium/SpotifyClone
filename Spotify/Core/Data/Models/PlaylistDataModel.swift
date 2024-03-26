//
//  PlaylistDataModel.swift
//  Spotify
//
//  Created by rauan on 3/22/24.
//

import Foundation

//struct PlaylistDataModel: Codable {
//    let collaborative: Bool
//    let description: String
//    let externalUrls: ExternalUrls
//    let followers: Followers
//    let href: String
//    let id: String
//    let images: [PlaylistDetailsImage]
//    let name: String
//    let owner: Owner
//    let welcomePublic: Bool
//    let snapshotID: String
//    let tracks: PlaylistTracks
//    let type, uri: String
//
//    enum CodingKeys: String, CodingKey {
//        case collaborative, description
//        case externalUrls = "external_urls"
//        case followers, href, id, images, name, owner
//        case welcomePublic = "public"
//        case snapshotID = "snapshot_id"
//        case tracks, type, uri
//    }
//}
//
//
//// MARK: - Followers
//struct Followers: Codable {
//    let total: Int
//}
//
//// MARK: - Image
//struct PlaylistDetailsImage: Codable {
//    let height: Int?
//    let url: String
//    let width: Int?
//}
//
//// MARK: - Owner
//struct Owner: Codable {
//    let displayName: String?
//    let href: String
//    let id: String
//    let type: TypeEnum
//    let uri: String
//    let name: String?
//
//    enum CodingKeys: String, CodingKey {
//        case displayName = "display_name"
//        
//        case href, id, type, uri, name
//    }
//}
//
//enum TypeEnum: String, Codable {
//    case artist = "artist"
//    case user = "user"
//}
//
//// MARK: - Tracks
//struct PlaylistTracks: Codable {
//    let href: String
//    let items: [PlaylistTracksItem]
//    let limit: Int
//    let offset: Int
//    let total: Int
//}
//
//// MARK: - Item
//struct PlaylistTracksItem: Codable {
//    let addedAt: Date
//    let addedBy: Owner
//    let isLocal: Bool
//    let track: PlaylistDetailsTrack
//
//    enum CodingKeys: String, CodingKey {
//        case addedAt = "added_at"
//        case addedBy = "added_by"
//        case isLocal = "is_local"
//        case track
//    }
//}
//
//// MARK: - Track
//struct PlaylistDetailsTrack: Codable {
//    let previewURL: String?
//    let availableMarkets: [String]
//    let explicit: Bool
//    let type: String
//    let episode, track: Bool
//    let album: Album
//    let artists: [Owner]
//    let discNumber, trackNumber, durationMS: Int
//
//    let href: String
//    let id, name: String
//    let popularity: Int
//    let uri: String
//    let isLocal: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case previewURL = "preview_url"
//        case availableMarkets = "available_markets"
//        case explicit, type, episode, track, album, artists
//        case discNumber = "disc_number"
//        case trackNumber = "track_number"
//        case durationMS = "duration_ms"
//        case href, id, name, popularity, uri
//        case isLocal = "is_local"
//    }
//}
//
//// MARK: - Album
//struct Album: Codable {
//    let availableMarkets: [String]
//    let type, albumType: String
//    let href: String
//    let id: String
//    let images: [Image]
//    let name, releaseDate, releaseDatePrecision, uri: String
//    let artists: [Owner]
//    let externalUrls: ExternalUrls
//    let totalTracks: Int
//
//    enum CodingKeys: String, CodingKey {
//        case availableMarkets = "available_markets"
//        case type
//        case albumType = "album_type"
//        case href, id, images, name
//        case releaseDate = "release_date"
//        case releaseDatePrecision = "release_date_precision"
//        case uri, artists
//        case externalUrls = "external_urls"
//        case totalTracks = "total_tracks"
//    }
//}



struct PlaylistDataModel: Decodable {
    let description: String
    let id: String
    let images: [PlaylistCoverImage]
    let name: String
    let owner: Owner
    let tracks: PlaylistDetailItems
}

struct PlaylistDetailItems: Decodable  {
    let items: [PlaylistTrack]
    let total: Int
}


struct PlaylistTrack: Decodable  {
    let track: PlaylistTrackItemDetails
}

struct PlaylistTrackItemDetails: Decodable {
    let artists: [PlaylistArtists]
    let duration: Int
    let name: String
    let id: String
    enum CodingKeys: String, CodingKey {
        case artists
        case duration = "duration_ms"
        case name
        case id
    }
}


struct PlaylistArtists: Decodable  {
    let name: String
    let id: String
}

struct PlaylistCoverImage: Decodable {
    let url: String
}

struct Owner: Decodable {
    let displayName: String
    
    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
    }
}


//{
//  "description": "A playlist for testing pourposes",
//  "id": "3cEYpjA9oz9GiPac4AsH4n",
//  "images": [
//    {
//      "url": "https://image-cdn-ak.spotifycdn.com/image/ab67706c0000da848d0ce13d55f634e290f744ba",
//      "height": null,
//      "width": null
//    }
//  ],
//  "name": "Spotify Web API Testing playlist",
//  "owner": {
//    "external_urls": {
//      "spotify": "https://open.spotify.com/user/jmperezperez"
//    },
//    "href": "https://api.spotify.com/v1/users/jmperezperez",
//    "id": "jmperezperez",
//    "type": "user",
//    "uri": "spotify:user:jmperezperez",
//    "display_name": "JMPerez²"
//  },
//  "tracks": {
//    "items": [
//      {
//        "track": {
//          "album": {
//            "album_type": "compilation",
//            "total_tracks": 20,
//            "external_urls": {
//              "spotify": "https://open.spotify.com/album/2pANdqPvxInB0YvcDiw4ko"
//            },
//            "href": "https://api.spotify.com/v1/albums/2pANdqPvxInB0YvcDiw4ko",
//            "id": "2pANdqPvxInB0YvcDiw4ko",
//            "images": [
//              {
//                "url": "https://i.scdn.co/image/ab67616d0000b273ce6d0eef0c1ce77e5f95bbbc",
//                "height": 640,
//                "width": 640
//              }
//            ],
//            "name": "Progressive Psy Trance Picks Vol.8",
//            "release_date": "2012-04-02",
//            "release_date_precision": "day",
//            "type": "album",
//            "uri": "spotify:album:2pANdqPvxInB0YvcDiw4ko",
//            "artists": [
//              {
//                "external_urls": {
//                  "spotify": "https://open.spotify.com/artist/0LyfQWJT6nXafLPZqxe9Of"
//                },
//                "href": "https://api.spotify.com/v1/artists/0LyfQWJT6nXafLPZqxe9Of",
//                "id": "0LyfQWJT6nXafLPZqxe9Of",
//                "name": "Various Artists",
//                "type": "artist",
//                "uri": "spotify:artist:0LyfQWJT6nXafLPZqxe9Of"
//              }
//            ]
//          },
//          "artists": [
//            {
//              "external_urls": {
//                "spotify": "https://open.spotify.com/artist/6eSdhw46riw2OUHgMwR8B5"
//              },
//              "href": "https://api.spotify.com/v1/artists/6eSdhw46riw2OUHgMwR8B5",
//              "id": "6eSdhw46riw2OUHgMwR8B5",
//              "name": "Odiseo",
//              "type": "artist",
//              "uri": "spotify:artist:6eSdhw46riw2OUHgMwR8B5"
//            }
//          ],
//          "duration_ms": 376000,
//          "id": "4rzfv0JLZfVhOhbSQ8o5jZ",
//          "track_number": 10,
//        },
//      },
//      
//    ]
//  },
//}
