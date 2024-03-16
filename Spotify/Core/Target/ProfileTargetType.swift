//
//  ProfileTargetType.swift
//  Spotify
//
//  Created by rauan on 3/1/24.
//

import Foundation

enum ProfileTargetType {
    case getProfileInfo
}

extension ProfileTargetType: BaseTargetType {
    var baseURL: URL {
        return URL(string: "https://api.spotify.com")!
    }
    var path: String {
        return "/v1/me"
    }
    var headers: [String : String]? {
        var header = [String: String]()
        AuthManager.shared.withValidToken { token in
            header["Authorization"] = "Bearer \(token)"
        }
        return header
    }
    
}


//{
//  "seeds": [
//    {
//      "afterFilteringSize": 313,
//      "afterRelinkingSize": 313,
//      "href": "https://api.spotify.com/v1/artists/4NHQUGzhtTLFvgF5SZesLK",
//      "id": "4NHQUGzhtTLFvgF5SZesLK",
//      "initialPoolSize": 500,
//      "type": "ARTIST"
//    },
//    {
//      "afterFilteringSize": 313,
//      "afterRelinkingSize": 313,
//      "href": "https://api.spotify.com/v1/tracks/0c6xIDDpzE81m2q797ordA",
//      "id": "0c6xIDDpzE81m2q797ordA",
//      "initialPoolSize": 500,
//      "type": "TRACK"
//    },
//    {
//      "afterFilteringSize": 313,
//      "afterRelinkingSize": 313,
//      "href": null,
//      "id": "classical",
//      "initialPoolSize": 517,
//      "type": "GENRE"
//    },
//    {
//      "afterFilteringSize": 313,
//      "afterRelinkingSize": 313,
//      "href": null,
//      "id": "country",
//      "initialPoolSize": 999,
//      "type": "GENRE"
//    }
//  ],
//  "tracks": [
//    {
//      "album": {
//        "album_type": "ALBUM",
//        "total_tracks": 16,
//        "available_markets": [],
//        "external_urls": {
//          "spotify": "https://open.spotify.com/album/0vOj0JVKv2bobFBBUTjgQF"
//        },
//        "href": "https://api.spotify.com/v1/albums/0vOj0JVKv2bobFBBUTjgQF",
//        "id": "0vOj0JVKv2bobFBBUTjgQF",
//        "images": [
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000b273e651d6dd8cc3af4288bf77b4",
//            "height": 640,
//            "width": 640
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00001e02e651d6dd8cc3af4288bf77b4",
//            "height": 300,
//            "width": 300
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00004851e651d6dd8cc3af4288bf77b4",
//            "height": 64,
//            "width": 64
//          }
//        ],
//        "name": "Come On Over",
//        "release_date": "1997",
//        "release_date_precision": "year",
//        "type": "album",
//        "uri": "spotify:album:0vOj0JVKv2bobFBBUTjgQF",
//        "artists": [
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/5e4Dhzv426EvQe3aDb64jL"
//            },
//            "href": "https://api.spotify.com/v1/artists/5e4Dhzv426EvQe3aDb64jL",
//            "id": "5e4Dhzv426EvQe3aDb64jL",
//            "name": "Shania Twain",
//            "type": "artist",
//            "uri": "spotify:artist:5e4Dhzv426EvQe3aDb64jL"
//          }
//        ]
//      },
//      "artists": [
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/5e4Dhzv426EvQe3aDb64jL"
//          },
//          "href": "https://api.spotify.com/v1/artists/5e4Dhzv426EvQe3aDb64jL",
//          "id": "5e4Dhzv426EvQe3aDb64jL",
//          "name": "Shania Twain",
//          "type": "artist",
//          "uri": "spotify:artist:5e4Dhzv426EvQe3aDb64jL"
//        }
//      ],
//      "available_markets": [],
//      "disc_number": 1,
//      "duration_ms": 233000,
//      "explicit": false,
//      "external_ids": {
//        "isrc": "USMR19887508"
//      },
//      "external_urls": {
//        "spotify": "https://open.spotify.com/track/0IF0vGwaJQ8ZCh0QxhW6OV"
//      },
//      "href": "https://api.spotify.com/v1/tracks/0IF0vGwaJQ8ZCh0QxhW6OV",
//      "id": "0IF0vGwaJQ8ZCh0QxhW6OV",
//      "name": "Man! I Feel Like A Woman!",
//      "popularity": 0,
//      "preview_url": null,
//      "track_number": 10,
//      "type": "track",
//      "uri": "spotify:track:0IF0vGwaJQ8ZCh0QxhW6OV",
//      "is_local": false
//    },
//    {
//      "album": {
//        "album_type": "ALBUM",
//        "total_tracks": 10,
//        "available_markets": ["CA", "US"],
//        "external_urls": {
//          "spotify": "https://open.spotify.com/album/7yI8ppmq1tmqF09Qbi1tcj"
//        },
//        "href": "https://api.spotify.com/v1/albums/7yI8ppmq1tmqF09Qbi1tcj",
//        "id": "7yI8ppmq1tmqF09Qbi1tcj",
//        "images": [
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000b273da2052e05dd848225e84ac5b",
//            "height": 640,
//            "width": 640
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00001e02da2052e05dd848225e84ac5b",
//            "height": 300,
//            "width": 300
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00004851da2052e05dd848225e84ac5b",
//            "height": 64,
//            "width": 64
//          }
//        ],
//        "name": "Justin Moore",
//        "release_date": "2009-01-01",
//        "release_date_precision": "day",
//        "type": "album",
//        "uri": "spotify:album:7yI8ppmq1tmqF09Qbi1tcj",
//        "artists": [
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/30e8DmahrEamvLbFRPdWmk"
//            },
//            "href": "https://api.spotify.com/v1/artists/30e8DmahrEamvLbFRPdWmk",
//            "id": "30e8DmahrEamvLbFRPdWmk",
//            "name": "Justin Moore",
//            "type": "artist",
//            "uri": "spotify:artist:30e8DmahrEamvLbFRPdWmk"
//          }
//        ]
//      },
//      "artists": [
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/30e8DmahrEamvLbFRPdWmk"
//          },
//          "href": "https://api.spotify.com/v1/artists/30e8DmahrEamvLbFRPdWmk",
//          "id": "30e8DmahrEamvLbFRPdWmk",
//          "name": "Justin Moore",
//          "type": "artist",
//          "uri": "spotify:artist:30e8DmahrEamvLbFRPdWmk"
//        }
//      ],
//      "available_markets": ["CA", "US"],
//      "disc_number": 1,
//      "duration_ms": 218853,
//      "explicit": false,
//      "external_ids": {
//        "isrc": "USLXJ0802024"
//      },
//      "external_urls": {
//        "spotify": "https://open.spotify.com/track/5pyB5WEAEwqwl18UaBLeBl"
//      },
//      "href": "https://api.spotify.com/v1/tracks/5pyB5WEAEwqwl18UaBLeBl",
//      "id": "5pyB5WEAEwqwl18UaBLeBl",
//      "name": "Small Town USA",
//      "popularity": 60,
//      "preview_url": null,
//      "track_number": 2,
//      "type": "track",
//      "uri": "spotify:track:5pyB5WEAEwqwl18UaBLeBl",
//      "is_local": false
//    },
//    {
//      "album": {
//        "album_type": "ALBUM",
//        "total_tracks": 18,
//        "available_markets": ["CA", "MX", "US"],
//        "external_urls": {
//          "spotify": "https://open.spotify.com/album/09mWpzpUOSjjvK2iNqEIYn"
//        },
//        "href": "https://api.spotify.com/v1/albums/09mWpzpUOSjjvK2iNqEIYn",
//        "id": "09mWpzpUOSjjvK2iNqEIYn",
//        "images": [
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000b2731b540c6520c468dfc0171a60",
//            "height": 640,
//            "width": 640
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00001e021b540c6520c468dfc0171a60",
//            "height": 300,
//            "width": 300
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d000048511b540c6520c468dfc0171a60",
//            "height": 64,
//            "width": 64
//          }
//        ],
//        "name": "Communion (Deluxe)",
//        "release_date": "2015-06-22",
//        "release_date_precision": "day",
//        "type": "album",
//        "uri": "spotify:album:09mWpzpUOSjjvK2iNqEIYn",
//        "artists": [
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/5vBSrE1xujD2FXYRarbAXc"
//            },
//            "href": "https://api.spotify.com/v1/artists/5vBSrE1xujD2FXYRarbAXc",
//            "id": "5vBSrE1xujD2FXYRarbAXc",
//            "name": "Olly Alexander (Years & Years)",
//            "type": "artist",
//            "uri": "spotify:artist:5vBSrE1xujD2FXYRarbAXc"
//          }
//        ]
//      },
//      "artists": [
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/5vBSrE1xujD2FXYRarbAXc"
//          },
//          "href": "https://api.spotify.com/v1/artists/5vBSrE1xujD2FXYRarbAXc",
//          "id": "5vBSrE1xujD2FXYRarbAXc",
//          "name": "Olly Alexander (Years & Years)",
//          "type": "artist",
//          "uri": "spotify:artist:5vBSrE1xujD2FXYRarbAXc"
//        },
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/4NHQUGzhtTLFvgF5SZesLK"
//          },
//          "href": "https://api.spotify.com/v1/artists/4NHQUGzhtTLFvgF5SZesLK",
//          "id": "4NHQUGzhtTLFvgF5SZesLK",
//          "name": "Tove Lo",
//          "type": "artist",
//          "uri": "spotify:artist:4NHQUGzhtTLFvgF5SZesLK"
//        }
//      ],
//      "available_markets": ["CA", "MX", "US"],
//      "disc_number": 1,
//      "duration_ms": 203204,
//      "explicit": false,
//      "external_ids": {
//        "isrc": "GBUM71600961"
//      },
//      "external_urls": {
//        "spotify": "https://open.spotify.com/track/4ZH03VC3uJk7uKk7CwsBqH"
//      },
//      "href": "https://api.spotify.com/v1/tracks/4ZH03VC3uJk7uKk7CwsBqH",
//      "id": "4ZH03VC3uJk7uKk7CwsBqH",
//      "name": "Desire",
//      "popularity": 52,
//      "preview_url": null,
//      "track_number": 18,
//      "type": "track",
//      "uri": "spotify:track:4ZH03VC3uJk7uKk7CwsBqH",
//      "is_local": false
//    },
//    {
//      "album": {
//        "album_type": "SINGLE",
//        "total_tracks": 1,
//        "available_markets": [],
//        "external_urls": {
//          "spotify": "https://open.spotify.com/album/2hU9PNi2qGldycgSKPE7vp"
//        },
//        "href": "https://api.spotify.com/v1/albums/2hU9PNi2qGldycgSKPE7vp",
//        "id": "2hU9PNi2qGldycgSKPE7vp",
//        "images": [
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000b273ce13670edbe770e429846e2c",
//            "height": 640,
//            "width": 640
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00001e02ce13670edbe770e429846e2c",
//            "height": 300,
//            "width": 300
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00004851ce13670edbe770e429846e2c",
//            "height": 64,
//            "width": 64
//          }
//        ],
//        "name": "Songs My Mother Taught Me (from \"Gypsy Songs\", Op. 55, No. 4)",
//        "release_date": "2015-09-04",
//        "release_date_precision": "day",
//        "type": "album",
//        "uri": "spotify:album:2hU9PNi2qGldycgSKPE7vp",
//        "artists": [
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/6n7nd5iceYpXVwcx8VPpxF"
//            },
//            "href": "https://api.spotify.com/v1/artists/6n7nd5iceYpXVwcx8VPpxF",
//            "id": "6n7nd5iceYpXVwcx8VPpxF",
//            "name": "Antonín Dvořák",
//            "type": "artist",
//            "uri": "spotify:artist:6n7nd5iceYpXVwcx8VPpxF"
//          },
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/5Dl3HXZjG6ZOWT5cV375lk"
//            },
//            "href": "https://api.spotify.com/v1/artists/5Dl3HXZjG6ZOWT5cV375lk",
//            "id": "5Dl3HXZjG6ZOWT5cV375lk",
//            "name": "Yo-Yo Ma",
//            "type": "artist",
//            "uri": "spotify:artist:5Dl3HXZjG6ZOWT5cV375lk"
//          },
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/7JmDqds7Y1LRSWZVM8e0Og"
//            },
//            "href": "https://api.spotify.com/v1/artists/7JmDqds7Y1LRSWZVM8e0Og",
//            "id": "7JmDqds7Y1LRSWZVM8e0Og",
//            "name": "Kathryn Stott",
//            "type": "artist",
//            "uri": "spotify:artist:7JmDqds7Y1LRSWZVM8e0Og"
//          }
//        ]
//      },
//      "artists": [
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/6n7nd5iceYpXVwcx8VPpxF"
//          },
//          "href": "https://api.spotify.com/v1/artists/6n7nd5iceYpXVwcx8VPpxF",
//          "id": "6n7nd5iceYpXVwcx8VPpxF",
//          "name": "Antonín Dvořák",
//          "type": "artist",
//          "uri": "spotify:artist:6n7nd5iceYpXVwcx8VPpxF"
//        },
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/7JmDqds7Y1LRSWZVM8e0Og"
//          },
//          "href": "https://api.spotify.com/v1/artists/7JmDqds7Y1LRSWZVM8e0Og",
//          "id": "7JmDqds7Y1LRSWZVM8e0Og",
//          "name": "Kathryn Stott",
//          "type": "artist",
//          "uri": "spotify:artist:7JmDqds7Y1LRSWZVM8e0Og"
//        },
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/5Dl3HXZjG6ZOWT5cV375lk"
//          },
//          "href": "https://api.spotify.com/v1/artists/5Dl3HXZjG6ZOWT5cV375lk",
//          "id": "5Dl3HXZjG6ZOWT5cV375lk",
//          "name": "Yo-Yo Ma",
//          "type": "artist",
//          "uri": "spotify:artist:5Dl3HXZjG6ZOWT5cV375lk"
//        }
//      ],
//      "available_markets": [],
//      "disc_number": 1,
//      "duration_ms": 116920,
//      "explicit": false,
//      "external_ids": {
//        "isrc": "USQX91500813"
//      },
//      "external_urls": {
//        "spotify": "https://open.spotify.com/track/7nnjUHV4bxuHVdrADKZber"
//      },
//      "href": "https://api.spotify.com/v1/tracks/7nnjUHV4bxuHVdrADKZber",
//      "id": "7nnjUHV4bxuHVdrADKZber",
//      "name": "Songs My Mother Taught Me (from \"Gypsy Songs\", Op. 55, No. 4)",
//      "popularity": 0,
//      "preview_url": null,
//      "track_number": 1,
//      "type": "track",
//      "uri": "spotify:track:7nnjUHV4bxuHVdrADKZber",
//      "is_local": false
//    },
//    {
//      "album": {
//        "album_type": "ALBUM",
//        "total_tracks": 19,
//        "available_markets": ["CA", "MX", "US"],
//        "external_urls": {
//          "spotify": "https://open.spotify.com/album/1teQxZPWNILIowWpQA6qfm"
//        },
//        "href": "https://api.spotify.com/v1/albums/1teQxZPWNILIowWpQA6qfm",
//        "id": "1teQxZPWNILIowWpQA6qfm",
//        "images": [
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000b273d73966976fd29781c3a8dde0",
//            "height": 640,
//            "width": 640
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00001e02d73966976fd29781c3a8dde0",
//            "height": 300,
//            "width": 300
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00004851d73966976fd29781c3a8dde0",
//            "height": 64,
//            "width": 64
//          }
//        ],
//        "name": "Queen Of The Clouds",
//        "release_date": "2014-09-24",
//        "release_date_precision": "day",
//        "type": "album",
//        "uri": "spotify:album:1teQxZPWNILIowWpQA6qfm",
//        "artists": [
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/4NHQUGzhtTLFvgF5SZesLK"
//            },
//            "href": "https://api.spotify.com/v1/artists/4NHQUGzhtTLFvgF5SZesLK",
//            "id": "4NHQUGzhtTLFvgF5SZesLK",
//            "name": "Tove Lo",
//            "type": "artist",
//            "uri": "spotify:artist:4NHQUGzhtTLFvgF5SZesLK"
//          }
//        ]
//      },
//      "artists": [
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/4NHQUGzhtTLFvgF5SZesLK"
//          },
//          "href": "https://api.spotify.com/v1/artists/4NHQUGzhtTLFvgF5SZesLK",
//          "id": "4NHQUGzhtTLFvgF5SZesLK",
//          "name": "Tove Lo",
//          "type": "artist",
//          "uri": "spotify:artist:4NHQUGzhtTLFvgF5SZesLK"
//        },
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/64q0R2cjmCVng0vVJUrH7c"
//          },
//          "href": "https://api.spotify.com/v1/artists/64q0R2cjmCVng0vVJUrH7c",
//          "id": "64q0R2cjmCVng0vVJUrH7c",
//          "name": "Ali Payami",
//          "type": "artist",
//          "uri": "spotify:artist:64q0R2cjmCVng0vVJUrH7c"
//        }
//      ],
//      "available_markets": ["CA", "MX", "US"],
//      "disc_number": 1,
//      "duration_ms": 171146,
//      "explicit": false,
//      "external_ids": {
//        "isrc": "SEUM71401646"
//      },
//      "external_urls": {
//        "spotify": "https://open.spotify.com/track/5loFfxDBNUsYCmdnhqw3qg"
//      },
//      "href": "https://api.spotify.com/v1/tracks/5loFfxDBNUsYCmdnhqw3qg",
//      "id": "5loFfxDBNUsYCmdnhqw3qg",
//      "name": "Not On Drugs - Ali Payami Remix",
//      "popularity": 25,
//      "preview_url": null,
//      "track_number": 19,
//      "type": "track",
//      "uri": "spotify:track:5loFfxDBNUsYCmdnhqw3qg",
//      "is_local": false
//    },
//    {
//      "album": {
//        "album_type": "ALBUM",
//        "total_tracks": 21,
//        "available_markets": ["AR", "AU", "AT", "BE", "BO", "BR", "BG", "CA", "CL", "CO", "CR", "CY", "CZ", "DK", "DO", "DE", "EC", "EE", "SV", "FI", "FR", "GR", "GT", "HN", "HK", "HU", "IS", "IE", "IT", "LV", "LT", "LU", "MY", "MT", "MX", "NL", "NZ", "NI", "NO", "PA", "PY", "PE", "PH", "PL", "PT", "SG", "SK", "ES", "SE", "CH", "TW", "TR", "UY", "US", "GB", "AD", "LI", "MC", "ID", "JP", "TH", "VN", "RO", "IL", "ZA", "SA", "AE", "BH", "QA", "OM", "KW", "EG", "MA", "DZ", "TN", "LB", "JO", "PS", "IN", "BY", "KZ", "MD", "UA", "AL", "BA", "HR", "ME", "MK", "RS", "SI", "KR", "BD", "PK", "LK", "GH", "KE", "NG", "TZ", "UG", "AG", "AM", "BS", "BB", "BZ", "BT", "BW", "BF", "CV", "CW", "DM", "FJ", "GM", "GE", "GD", "GW", "GY", "HT", "JM", "KI", "LS", "LR", "MW", "MV", "ML", "MH", "FM", "NA", "NR", "NE", "PW", "PG", "WS", "SM", "ST", "SN", "SC", "SL", "SB", "KN", "LC", "VC", "SR", "TL", "TO", "TT", "TV", "VU", "AZ", "BN", "BI", "KH", "CM", "TD", "KM", "GQ", "SZ", "GA", "GN", "KG", "LA", "MO", "MR", "MN", "NP", "RW", "TG", "UZ", "ZW", "BJ", "MG", "MU", "MZ", "AO", "CI", "DJ", "ZM", "CD", "CG", "IQ", "LY", "TJ", "VE", "ET", "XK"],
//        "external_urls": {
//          "spotify": "https://open.spotify.com/album/6WB0uSzP87B9k4Qr3uvGdU"
//        },
//        "href": "https://api.spotify.com/v1/albums/6WB0uSzP87B9k4Qr3uvGdU",
//        "id": "6WB0uSzP87B9k4Qr3uvGdU",
//        "images": [
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000b2730ca635d1def49167c9a9b210",
//            "height": 640,
//            "width": 640
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00001e020ca635d1def49167c9a9b210",
//            "height": 300,
//            "width": 300
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d000048510ca635d1def49167c9a9b210",
//            "height": 64,
//            "width": 64
//          }
//        ],
//        "name": "The Essential Itzhak Perlman",
//        "release_date": "1966",
//        "release_date_precision": "year",
//        "type": "album",
//        "uri": "spotify:album:6WB0uSzP87B9k4Qr3uvGdU",
//        "artists": [
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/0hIG9FXgjQxT8fKaYceFbA"
//            },
//            "href": "https://api.spotify.com/v1/artists/0hIG9FXgjQxT8fKaYceFbA",
//            "id": "0hIG9FXgjQxT8fKaYceFbA",
//            "name": "Itzhak Perlman",
//            "type": "artist",
//            "uri": "spotify:artist:0hIG9FXgjQxT8fKaYceFbA"
//          }
//        ]
//      },
//      "artists": [
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/17hR0sYHpx7VYTMRfFUOmY"
//          },
//          "href": "https://api.spotify.com/v1/artists/17hR0sYHpx7VYTMRfFUOmY",
//          "id": "17hR0sYHpx7VYTMRfFUOmY",
//          "name": "Maurice Ravel",
//          "type": "artist",
//          "uri": "spotify:artist:17hR0sYHpx7VYTMRfFUOmY"
//        },
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/0hIG9FXgjQxT8fKaYceFbA"
//          },
//          "href": "https://api.spotify.com/v1/artists/0hIG9FXgjQxT8fKaYceFbA",
//          "id": "0hIG9FXgjQxT8fKaYceFbA",
//          "name": "Itzhak Perlman",
//          "type": "artist",
//          "uri": "spotify:artist:0hIG9FXgjQxT8fKaYceFbA"
//        },
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/2tfWguHr2nj4e8KXLKciVq"
//          },
//          "href": "https://api.spotify.com/v1/artists/2tfWguHr2nj4e8KXLKciVq",
//          "id": "2tfWguHr2nj4e8KXLKciVq",
//          "name": "André Previn",
//          "type": "artist",
//          "uri": "spotify:artist:2tfWguHr2nj4e8KXLKciVq"
//        },
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/5yxyJsFanEAuwSM5kOuZKc"
//          },
//          "href": "https://api.spotify.com/v1/artists/5yxyJsFanEAuwSM5kOuZKc",
//          "id": "5yxyJsFanEAuwSM5kOuZKc",
//          "name": "London Symphony Orchestra",
//          "type": "artist",
//          "uri": "spotify:artist:5yxyJsFanEAuwSM5kOuZKc"
//        }
//      ],
//      "available_markets": ["AR", "AU", "AT", "BE", "BO", "BR", "BG", "CA", "CL", "CO", "CR", "CY", "CZ", "DK", "DO", "DE", "EC", "EE", "SV", "FI", "FR", "GR", "GT", "HN", "HK", "HU", "IS", "IE", "IT", "LV", "LT", "LU", "MY", "MT", "MX", "NL", "NZ", "NI", "NO", "PA", "PY", "PE", "PH", "PL", "PT", "SG", "SK", "ES", "SE", "CH", "TW", "TR", "UY", "US", "GB", "AD", "LI", "MC", "ID", "JP", "TH", "VN", "RO", "IL", "ZA", "SA", "AE", "BH", "QA", "OM", "KW", "EG", "MA", "DZ", "TN", "LB", "JO", "PS", "IN", "BY", "KZ", "MD", "UA", "AL", "BA", "HR", "ME", "MK", "RS", "SI", "KR", "BD", "PK", "LK", "GH", "KE", "NG", "TZ", "UG", "AG", "AM", "BS", "BB", "BZ", "BT", "BW", "BF", "CV", "CW", "DM", "FJ", "GM", "GE", "GD", "GW", "GY", "HT", "JM", "KI", "LS", "LR", "MW", "MV", "ML", "MH", "FM", "NA", "NR", "NE", "PW", "PG", "WS", "SM", "ST", "SN", "SC", "SL", "SB", "KN", "LC", "VC", "SR", "TL", "TO", "TT", "TV", "VU", "AZ", "BN", "BI", "KH", "CM", "TD", "KM", "GQ", "SZ", "GA", "GN", "KG", "LA", "MO", "MR", "MN", "NP", "RW", "TG", "UZ", "ZW", "BJ", "MG", "MU", "MZ", "AO", "CI", "DJ", "ZM", "CD", "CG", "IQ", "LY", "TJ", "VE", "ET", "XK"],
//      "disc_number": 1,
//      "duration_ms": 588386,
//      "explicit": false,
//      "external_ids": {
//        "isrc": "USBC16800212"
//      },
//      "external_urls": {
//        "spotify": "https://open.spotify.com/track/1OacCHsUQIAuUtlqv4I0c2"
//      },
//      "href": "https://api.spotify.com/v1/tracks/1OacCHsUQIAuUtlqv4I0c2",
//      "id": "1OacCHsUQIAuUtlqv4I0c2",
//      "name": "Tzigane, M. 76 (Version for Violin & Orchestra)",
//      "popularity": 19,
//      "preview_url": "https://p.scdn.co/mp3-preview/784153e19c725d2eb774ac14c214a07ec4fdc925?cid=6046cf4a650c41f985b4ccf3ee4603e2",
//      "track_number": 2,
//      "type": "track",
//      "uri": "spotify:track:1OacCHsUQIAuUtlqv4I0c2",
//      "is_local": false
//    },
//    {
//      "album": {
//        "album_type": "ALBUM",
//        "total_tracks": 17,
//        "available_markets": ["AR", "AU", "AT", "BE", "BO", "BR", "BG", "CA", "CL", "CO", "CR", "CY", "CZ", "DK", "DO", "DE", "EC", "EE", "SV", "FI", "FR", "GR", "GT", "HN", "HK", "HU", "IS", "IE", "IT", "LV", "LT", "LU", "MY", "MT", "MX", "NL", "NZ", "NI", "NO", "PA", "PY", "PE", "PH", "PL", "PT", "SG", "SK", "ES", "SE", "CH", "TW", "TR", "UY", "US", "GB", "AD", "LI", "MC", "ID", "JP", "TH", "VN", "RO", "IL", "ZA", "SA", "AE", "BH", "QA", "OM", "KW", "EG", "MA", "DZ", "TN", "LB", "JO", "PS", "IN", "BY", "KZ", "MD", "UA", "AL", "BA", "HR", "ME", "MK", "RS", "SI", "KR", "BD", "PK", "LK", "GH", "KE", "NG", "TZ", "UG", "AG", "AM", "BS", "BB", "BZ", "BT", "BW", "BF", "CV", "CW", "DM", "FJ", "GM", "GE", "GD", "GW", "GY", "HT", "JM", "KI", "LS", "LR", "MW", "MV", "ML", "MH", "FM", "NA", "NR", "NE", "PW", "PG", "WS", "SM", "ST", "SN", "SC", "SL", "SB", "KN", "LC", "VC", "SR", "TL", "TO", "TT", "TV", "VU", "AZ", "BN", "BI", "KH", "CM", "TD", "KM", "GQ", "SZ", "GA", "GN", "KG", "LA", "MO", "MR", "MN", "NP", "RW", "TG", "UZ", "ZW", "BJ", "MG", "MU", "MZ", "AO", "CI", "DJ", "ZM", "CD", "CG", "IQ", "LY", "TJ", "VE", "ET", "XK"],
//        "external_urls": {
//          "spotify": "https://open.spotify.com/album/53Oa5Bu0UTU8o8qCTaHKoz"
//        },
//        "href": "https://api.spotify.com/v1/albums/53Oa5Bu0UTU8o8qCTaHKoz",
//        "id": "53Oa5Bu0UTU8o8qCTaHKoz",
//        "images": [
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000b273ccba76fad1c624c09e72bc78",
//            "height": 640,
//            "width": 640
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00001e02ccba76fad1c624c09e72bc78",
//            "height": 300,
//            "width": 300
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00004851ccba76fad1c624c09e72bc78",
//            "height": 64,
//            "width": 64
//          }
//        ],
//        "name": "This One's for You Too (Deluxe Edition)",
//        "release_date": "2018-06-01",
//        "release_date_precision": "day",
//        "type": "album",
//        "uri": "spotify:album:53Oa5Bu0UTU8o8qCTaHKoz",
//        "artists": [
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/718COspgdWOnwOFpJHRZHS"
//            },
//            "href": "https://api.spotify.com/v1/artists/718COspgdWOnwOFpJHRZHS",
//            "id": "718COspgdWOnwOFpJHRZHS",
//            "name": "Luke Combs",
//            "type": "artist",
//            "uri": "spotify:artist:718COspgdWOnwOFpJHRZHS"
//          }
//        ]
//      },
//      "artists": [
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/718COspgdWOnwOFpJHRZHS"
//          },
//          "href": "https://api.spotify.com/v1/artists/718COspgdWOnwOFpJHRZHS",
//          "id": "718COspgdWOnwOFpJHRZHS",
//          "name": "Luke Combs",
//          "type": "artist",
//          "uri": "spotify:artist:718COspgdWOnwOFpJHRZHS"
//        }
//      ],
//      "available_markets": ["AR", "AU", "AT", "BE", "BO", "BR", "BG", "CA", "CL", "CO", "CR", "CY", "CZ", "DK", "DO", "DE", "EC", "EE", "SV", "FI", "FR", "GR", "GT", "HN", "HK", "HU", "IS", "IE", "IT", "LV", "LT", "LU", "MY", "MT", "MX", "NL", "NZ", "NI", "NO", "PA", "PY", "PE", "PH", "PL", "PT", "SG", "SK", "ES", "SE", "CH", "TW", "TR", "UY", "US", "GB", "AD", "LI", "MC", "ID", "JP", "TH", "VN", "RO", "IL", "ZA", "SA", "AE", "BH", "QA", "OM", "KW", "EG", "MA", "DZ", "TN", "LB", "JO", "PS", "IN", "BY", "KZ", "MD", "UA", "AL", "BA", "HR", "ME", "MK", "RS", "SI", "KR", "BD", "PK", "LK", "GH", "KE", "NG", "TZ", "UG", "AG", "AM", "BS", "BB", "BZ", "BT", "BW", "BF", "CV", "CW", "DM", "FJ", "GM", "GE", "GD", "GW", "GY", "HT", "JM", "KI", "LS", "LR", "MW", "MV", "ML", "MH", "FM", "NA", "NR", "NE", "PW", "PG", "WS", "SM", "ST", "SN", "SC", "SL", "SB", "KN", "LC", "VC", "SR", "TL", "TO", "TT", "TV", "VU", "AZ", "BN", "BI", "KH", "CM", "TD", "KM", "GQ", "SZ", "GA", "GN", "KG", "LA", "MO", "MR", "MN", "NP", "RW", "TG", "UZ", "ZW", "BJ", "MG", "MU", "MZ", "AO", "CI", "DJ", "ZM", "CD", "CG", "IQ", "LY", "TJ", "VE", "ET", "XK"],
//      "disc_number": 1,
//      "duration_ms": 183160,
//      "explicit": false,
//      "external_ids": {
//        "isrc": "US6XF1700267"
//      },
//      "external_urls": {
//        "spotify": "https://open.spotify.com/track/698eQRku24PIYPQPHItKlA"
//      },
//      "href": "https://api.spotify.com/v1/tracks/698eQRku24PIYPQPHItKlA",
//      "id": "698eQRku24PIYPQPHItKlA",
//      "name": "She Got the Best of Me",
//      "popularity": 80,
//      "preview_url": "https://p.scdn.co/mp3-preview/62987b51b76bd417ac56812161cf825d4c22f549?cid=6046cf4a650c41f985b4ccf3ee4603e2",
//      "track_number": 17,
//      "type": "track",
//      "uri": "spotify:track:698eQRku24PIYPQPHItKlA",
//      "is_local": false
//    },
//    {
//      "album": {
//        "album_type": "ALBUM",
//        "total_tracks": 18,
//        "available_markets": [],
//        "external_urls": {
//          "spotify": "https://open.spotify.com/album/3Q1fYsdTHS2PYz4IKp0Jnc"
//        },
//        "href": "https://api.spotify.com/v1/albums/3Q1fYsdTHS2PYz4IKp0Jnc",
//        "id": "3Q1fYsdTHS2PYz4IKp0Jnc",
//        "images": [
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000b27380466b905c425451ecb4a8ea",
//            "height": 640,
//            "width": 640
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00001e0280466b905c425451ecb4a8ea",
//            "height": 300,
//            "width": 300
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000485180466b905c425451ecb4a8ea",
//            "height": 64,
//            "width": 64
//          }
//        ],
//        "name": "The Album",
//        "release_date": "2019-11-15",
//        "release_date_precision": "day",
//        "type": "album",
//        "uri": "spotify:album:3Q1fYsdTHS2PYz4IKp0Jnc",
//        "artists": [
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/1L9i6qZYIGQedgM9QLSyzb"
//            },
//            "href": "https://api.spotify.com/v1/artists/1L9i6qZYIGQedgM9QLSyzb",
//            "id": "1L9i6qZYIGQedgM9QLSyzb",
//            "name": "Klingande",
//            "type": "artist",
//            "uri": "spotify:artist:1L9i6qZYIGQedgM9QLSyzb"
//          }
//        ]
//      },
//      "artists": [
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/1L9i6qZYIGQedgM9QLSyzb"
//          },
//          "href": "https://api.spotify.com/v1/artists/1L9i6qZYIGQedgM9QLSyzb",
//          "id": "1L9i6qZYIGQedgM9QLSyzb",
//          "name": "Klingande",
//          "type": "artist",
//          "uri": "spotify:artist:1L9i6qZYIGQedgM9QLSyzb"
//        }
//      ],
//      "available_markets": [],
//      "disc_number": 2,
//      "duration_ms": 283638,
//      "explicit": false,
//      "external_ids": {
//        "isrc": "FR6V81680341"
//      },
//      "external_urls": {
//        "spotify": "https://open.spotify.com/track/27ZhKzjHoE0UUlyMXu0ZFa"
//      },
//      "href": "https://api.spotify.com/v1/tracks/27ZhKzjHoE0UUlyMXu0ZFa",
//      "id": "27ZhKzjHoE0UUlyMXu0ZFa",
//      "name": "Jubel",
//      "popularity": 22,
//      "preview_url": null,
//      "track_number": 1,
//      "type": "track",
//      "uri": "spotify:track:27ZhKzjHoE0UUlyMXu0ZFa",
//      "is_local": false
//    },
//    {
//      "album": {
//        "album_type": "SINGLE",
//        "total_tracks": 1,
//        "available_markets": ["AR", "AU", "BE", "BO", "BR", "BG", "CA", "CL", "CO", "CR", "CY", "CZ", "DK", "DO", "EC", "EE", "SV", "FI", "FR", "GR", "GT", "HN", "HK", "HU", "IS", "IT", "LV", "LT", "LU", "MY", "MT", "MX", "NL", "NZ", "NI", "NO", "PA", "PY", "PE", "PH", "PL", "PT", "SG", "SK", "ES", "SE", "TW", "TR", "UY", "US", "AD", "LI", "MC", "ID", "JP", "TH", "VN", "RO", "IL", "ZA", "SA", "AE", "BH", "QA", "OM", "KW", "EG", "MA", "DZ", "TN", "LB", "JO", "PS", "IN", "BY", "KZ", "MD", "UA", "AL", "BA", "HR", "ME", "MK", "RS", "SI", "KR", "BD", "PK", "LK", "GH", "KE", "NG", "TZ", "UG", "AG", "AM", "BS", "BB", "BZ", "BT", "BW", "BF", "CV", "CW", "DM", "FJ", "GM", "GE", "GD", "GW", "GY", "HT", "JM", "KI", "LS", "LR", "MW", "MV", "ML", "MH", "FM", "NA", "NR", "NE", "PW", "PG", "WS", "SM", "ST", "SN", "SC", "SL", "SB", "KN", "LC", "VC", "SR", "TL", "TO", "TT", "TV", "VU", "AZ", "BN", "BI", "KH", "CM", "TD", "KM", "GQ", "SZ", "GA", "GN", "KG", "LA", "MO", "MR", "MN", "NP", "RW", "TG", "UZ", "ZW", "BJ", "MG", "MU", "MZ", "AO", "CI", "DJ", "ZM", "CD", "CG", "IQ", "LY", "TJ", "VE", "ET", "XK"],
//        "external_urls": {
//          "spotify": "https://open.spotify.com/album/2APVXYBFX7sOVQ8HLO6kG9"
//        },
//        "href": "https://api.spotify.com/v1/albums/2APVXYBFX7sOVQ8HLO6kG9",
//        "id": "2APVXYBFX7sOVQ8HLO6kG9",
//        "images": [
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000b2732846be215149628edfa95d97",
//            "height": 640,
//            "width": 640
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00001e022846be215149628edfa95d97",
//            "height": 300,
//            "width": 300
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d000048512846be215149628edfa95d97",
//            "height": 64,
//            "width": 64
//          }
//        ],
//        "name": "Let Me Hold You (Turn Me On)",
//        "release_date": "2016-04-13",
//        "release_date_precision": "day",
//        "type": "album",
//        "uri": "spotify:album:2APVXYBFX7sOVQ8HLO6kG9",
//        "artists": [
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/7DMveApC7UnC2NPfPvlHSU"
//            },
//            "href": "https://api.spotify.com/v1/artists/7DMveApC7UnC2NPfPvlHSU",
//            "id": "7DMveApC7UnC2NPfPvlHSU",
//            "name": "Cheat Codes",
//            "type": "artist",
//            "uri": "spotify:artist:7DMveApC7UnC2NPfPvlHSU"
//          },
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/1b4DN8Vj0dnj5cceMFsRYN"
//            },
//            "href": "https://api.spotify.com/v1/artists/1b4DN8Vj0dnj5cceMFsRYN",
//            "id": "1b4DN8Vj0dnj5cceMFsRYN",
//            "name": "Dante Klein",
//            "type": "artist",
//            "uri": "spotify:artist:1b4DN8Vj0dnj5cceMFsRYN"
//          }
//        ]
//      },
//      "artists": [
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/7DMveApC7UnC2NPfPvlHSU"
//          },
//          "href": "https://api.spotify.com/v1/artists/7DMveApC7UnC2NPfPvlHSU",
//          "id": "7DMveApC7UnC2NPfPvlHSU",
//          "name": "Cheat Codes",
//          "type": "artist",
//          "uri": "spotify:artist:7DMveApC7UnC2NPfPvlHSU"
//        },
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/1b4DN8Vj0dnj5cceMFsRYN"
//          },
//          "href": "https://api.spotify.com/v1/artists/1b4DN8Vj0dnj5cceMFsRYN",
//          "id": "1b4DN8Vj0dnj5cceMFsRYN",
//          "name": "Dante Klein",
//          "type": "artist",
//          "uri": "spotify:artist:1b4DN8Vj0dnj5cceMFsRYN"
//        }
//      ],
//      "available_markets": ["AR", "AU", "BE", "BO", "BR", "BG", "CA", "CL", "CO", "CR", "CY", "CZ", "DK", "DO", "EC", "EE", "SV", "FI", "FR", "GR", "GT", "HN", "HK", "HU", "IS", "IT", "LV", "LT", "LU", "MY", "MT", "MX", "NL", "NZ", "NI", "NO", "PA", "PY", "PE", "PH", "PL", "PT", "SG", "SK", "ES", "SE", "TW", "TR", "UY", "US", "AD", "LI", "MC", "ID", "JP", "TH", "VN", "RO", "IL", "ZA", "SA", "AE", "BH", "QA", "OM", "KW", "EG", "MA", "DZ", "TN", "LB", "JO", "PS", "IN", "BY", "KZ", "MD", "UA", "AL", "BA", "HR", "ME", "MK", "RS", "SI", "KR", "BD", "PK", "LK", "GH", "KE", "NG", "TZ", "UG", "AG", "AM", "BS", "BB", "BZ", "BT", "BW", "BF", "CV", "CW", "DM", "FJ", "GM", "GE", "GD", "GW", "GY", "HT", "JM", "KI", "LS", "LR", "MW", "MV", "ML", "MH", "FM", "NA", "NR", "NE", "PW", "PG", "WS", "SM", "ST", "SN", "SC", "SL", "SB", "KN", "LC", "VC", "SR", "TL", "TO", "TT", "TV", "VU", "AZ", "BN", "BI", "KH", "CM", "TD", "KM", "GQ", "SZ", "GA", "GN", "KG", "LA", "MO", "MR", "MN", "NP", "RW", "TG", "UZ", "ZW", "BJ", "MG", "MU", "MZ", "AO", "CI", "DJ", "ZM", "CD", "CG", "IQ", "LY", "TJ", "VE", "ET", "XK"],
//      "disc_number": 1,
//      "duration_ms": 162425,
//      "explicit": false,
//      "external_ids": {
//        "isrc": "NLZ541600032"
//      },
//      "external_urls": {
//        "spotify": "https://open.spotify.com/track/3aLWuWKHaTV4Ok7LKvXRYn"
//      },
//      "href": "https://api.spotify.com/v1/tracks/3aLWuWKHaTV4Ok7LKvXRYn",
//      "id": "3aLWuWKHaTV4Ok7LKvXRYn",
//      "name": "Let Me Hold You (Turn Me On)",
//      "popularity": 61,
//      "preview_url": "https://p.scdn.co/mp3-preview/9640b4aa175f02a2a53d08d3f67338dfb3c72318?cid=6046cf4a650c41f985b4ccf3ee4603e2",
//      "track_number": 1,
//      "type": "track",
//      "uri": "spotify:track:3aLWuWKHaTV4Ok7LKvXRYn",
//      "is_local": false
//    },
//    {
//      "album": {
//        "album_type": "SINGLE",
//        "total_tracks": 4,
//        "external_urls": {
//          "spotify": "https://open.spotify.com/album/5JVyNX3e2hGoOttoe7B8QL"
//        },
//        "href": "https://api.spotify.com/v1/albums/5JVyNX3e2hGoOttoe7B8QL",
//        "id": "5JVyNX3e2hGoOttoe7B8QL",
//        "images": [
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000b2733b1e6a6f5aa7c01b433779fe",
//            "height": 640,
//            "width": 640
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00001e023b1e6a6f5aa7c01b433779fe",
//            "height": 300,
//            "width": 300
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d000048513b1e6a6f5aa7c01b433779fe",
//            "height": 64,
//            "width": 64
//          }
//        ],
//        "name": "Push The Feeling On",
//        "release_date": "1995",
//        "release_date_precision": "year",
//        "type": "album",
//        "uri": "spotify:album:5JVyNX3e2hGoOttoe7B8QL",
//        "artists": [
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/1gALaWbNDnwS2ECV09sn2A"
//            },
//            "href": "https://api.spotify.com/v1/artists/1gALaWbNDnwS2ECV09sn2A",
//            "id": "1gALaWbNDnwS2ECV09sn2A",
//            "name": "Nightcrawlers",
//            "type": "artist",
//            "uri": "spotify:artist:1gALaWbNDnwS2ECV09sn2A"
//          }
//        ]
//      },
//      "artists": [
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/1gALaWbNDnwS2ECV09sn2A"
//          },
//          "href": "https://api.spotify.com/v1/artists/1gALaWbNDnwS2ECV09sn2A",
//          "id": "1gALaWbNDnwS2ECV09sn2A",
//          "name": "Nightcrawlers",
//          "type": "artist",
//          "uri": "spotify:artist:1gALaWbNDnwS2ECV09sn2A"
//        },
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/1yqxFtPHKcGcv6SXZNdyT9"
//          },
//          "href": "https://api.spotify.com/v1/artists/1yqxFtPHKcGcv6SXZNdyT9",
//          "id": "1yqxFtPHKcGcv6SXZNdyT9",
//          "name": "MK",
//          "type": "artist",
//          "uri": "spotify:artist:1yqxFtPHKcGcv6SXZNdyT9"
//        }
//      ],
//      
//      "disc_number": 1,
//      "duration_ms": 243160,
//      "explicit": false,
//      "external_ids": {
//        "isrc": "GBANY9500081"
//      },
//      "external_urls": {
//        "spotify": "https://open.spotify.com/track/1EWsVHU4FNAdtN4R8FETag"
//      },
//      "href": "https://api.spotify.com/v1/tracks/1EWsVHU4FNAdtN4R8FETag",
//      "id": "1EWsVHU4FNAdtN4R8FETag",
//      "name": "Push The Feeling On - Mk Dub Revisited Edit",
//      "popularity": 68,
//      "preview_url": null,
//      "track_number": 1,
//      "type": "track",
//      "uri": "spotify:track:1EWsVHU4FNAdtN4R8FETag",
//      "is_local": false
//    },
//    {
//      "album": {
//        "album_type": "ALBUM",
//        "total_tracks": 26,
//        "available_markets": ["AR", "AU", "AT", "BE", "BO", "BR", "BG", "CA", "CL", "CO", "CR", "CY", "CZ", "DK", "DO", "DE", "EC", "EE", "SV", "FI", "FR", "GR", "GT", "HN", "HK", "HU", "IS", "IE", "IT", "LV", "LT", "LU", "MY", "MT", "MX", "NL", "NZ", "NI", "NO", "PA", "PY", "PE", "PH", "PL", "PT", "SG", "SK", "ES", "SE", "CH", "TW", "TR", "UY", "GB", "AD", "LI", "MC", "ID", "TH", "VN", "RO", "IL", "ZA", "SA", "AE", "BH", "QA", "OM", "KW", "EG", "MA", "DZ", "TN", "LB", "JO", "PS", "IN", "BY", "KZ", "MD", "UA", "AL", "BA", "HR", "ME", "MK", "RS", "SI", "KR", "BD", "PK", "LK", "GH", "KE", "NG", "TZ", "UG", "AG", "AM", "BS", "BB", "BZ", "BT", "BW", "BF", "CV", "CW", "DM", "FJ", "GM", "GE", "GD", "GW", "GY", "HT", "JM", "KI", "LS", "LR", "MW", "MV", "ML", "MH", "FM", "NA", "NR", "NE", "PW", "PG", "WS", "SM", "ST", "SN", "SC", "SL", "SB", "KN", "LC", "VC", "SR", "TL", "TO", "TT", "TV", "VU", "AZ", "BN", "BI", "KH", "CM", "TD", "KM", "GQ", "SZ", "GA", "GN", "KG", "LA", "MO", "MR", "MN", "NP", "RW", "TG", "UZ", "ZW", "BJ", "MG", "MU", "MZ", "AO", "CI", "DJ", "ZM", "CD", "CG", "IQ", "LY", "TJ", "VE", "ET", "XK"],
//        "external_urls": {
//          "spotify": "https://open.spotify.com/album/1fuDdObQ1ncWsOEUjKIQxv"
//        },
//        "href": "https://api.spotify.com/v1/albums/1fuDdObQ1ncWsOEUjKIQxv",
//        "id": "1fuDdObQ1ncWsOEUjKIQxv",
//        "images": [
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000b273ef450ef6b6e094dd69e83272",
//            "height": 640,
//            "width": 640
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00001e02ef450ef6b6e094dd69e83272",
//            "height": 300,
//            "width": 300
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00004851ef450ef6b6e094dd69e83272",
//            "height": 64,
//            "width": 64
//          }
//        ],
//        "name": "Junto (Special Edition)",
//        "release_date": "2014-08-25",
//        "release_date_precision": "day",
//        "type": "album",
//        "uri": "spotify:album:1fuDdObQ1ncWsOEUjKIQxv",
//        "artists": [
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/4YrKBkKSVeqDamzBPWVnSJ"
//            },
//            "href": "https://api.spotify.com/v1/artists/4YrKBkKSVeqDamzBPWVnSJ",
//            "id": "4YrKBkKSVeqDamzBPWVnSJ",
//            "name": "Basement Jaxx",
//            "type": "artist",
//            "uri": "spotify:artist:4YrKBkKSVeqDamzBPWVnSJ"
//          }
//        ]
//      },
//      "artists": [
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/4YrKBkKSVeqDamzBPWVnSJ"
//          },
//          "href": "https://api.spotify.com/v1/artists/4YrKBkKSVeqDamzBPWVnSJ",
//          "id": "4YrKBkKSVeqDamzBPWVnSJ",
//          "name": "Basement Jaxx",
//          "type": "artist",
//          "uri": "spotify:artist:4YrKBkKSVeqDamzBPWVnSJ"
//        }
//      ],
//      "available_markets": ["AR", "AU", "AT", "BE", "BO", "BR", "BG", "CA", "CL", "CO", "CR", "CY", "CZ", "DK", "DO", "DE", "EC", "EE", "SV", "FI", "FR", "GR", "GT", "HN", "HK", "HU", "IS", "IE", "IT", "LV", "LT", "LU", "MY", "MT", "MX", "NL", "NZ", "NI", "NO", "PA", "PY", "PE", "PH", "PL", "PT", "SG", "SK", "ES", "SE", "CH", "TW", "TR", "UY", "GB", "AD", "LI", "MC", "ID", "TH", "VN", "RO", "IL", "ZA", "SA", "AE", "BH", "QA", "OM", "KW", "EG", "MA", "DZ", "TN", "LB", "JO", "PS", "IN", "BY", "KZ", "MD", "UA", "AL", "BA", "HR", "ME", "MK", "RS", "SI", "KR", "BD", "PK", "LK", "GH", "KE", "NG", "TZ", "UG", "AG", "AM", "BS", "BB", "BZ", "BT", "BW", "BF", "CV", "CW", "DM", "FJ", "GM", "GE", "GD", "GW", "GY", "HT", "JM", "KI", "LS", "LR", "MW", "MV", "ML", "MH", "FM", "NA", "NR", "NE", "PW", "PG", "WS", "SM", "ST", "SN", "SC", "SL", "SB", "KN", "LC", "VC", "SR", "TL", "TO", "TT", "TV", "VU", "AZ", "BN", "BI", "KH", "CM", "TD", "KM", "GQ", "SZ", "GA", "GN", "KG", "LA", "MO", "MR", "MN", "NP", "RW", "TG", "UZ", "ZW", "BJ", "MG", "MU", "MZ", "AO", "CI", "DJ", "ZM", "CD", "CG", "IQ", "LY", "TJ", "VE", "ET", "XK"],
//      "disc_number": 1,
//      "duration_ms": 263053,
//      "explicit": false,
//      "external_ids": {
//        "isrc": "GBPVV1400877"
//      },
//      "external_urls": {
//        "spotify": "https://open.spotify.com/track/42suZFjDtBbl9sESKm4oj2"
//      },
//      "href": "https://api.spotify.com/v1/tracks/42suZFjDtBbl9sESKm4oj2",
//      "id": "42suZFjDtBbl9sESKm4oj2",
//      "name": "Never Say Never - Extended Mix",
//      "popularity": 38,
//      "preview_url": "https://p.scdn.co/mp3-preview/1570c3fd81425fafc9d6199a3a6de18fd408ed7c?cid=6046cf4a650c41f985b4ccf3ee4603e2",
//      "track_number": 4,
//      "type": "track",
//      "uri": "spotify:track:42suZFjDtBbl9sESKm4oj2",
//      "is_local": false
//    },
//    {
//      "album": {
//        "album_type": "ALBUM",
//        "total_tracks": 18,
//        "available_markets": ["AR", "AU", "AT", "BE", "BO", "BR", "BG", "CA", "CL", "CO", "CR", "CY", "CZ", "DK", "DO", "DE", "EC", "EE", "SV", "FI", "FR", "GR", "GT", "HN", "HK", "HU", "IS", "IE", "IT", "LV", "LT", "LU", "MY", "MT", "MX", "NL", "NZ", "NI", "NO", "PA", "PY", "PE", "PH", "PL", "PT", "SG", "SK", "ES", "SE", "CH", "TW", "TR", "UY", "GB", "AD", "LI", "MC", "ID", "JP", "TH", "VN", "RO", "IL", "ZA", "SA", "AE", "BH", "QA", "OM", "KW", "EG", "MA", "DZ", "TN", "LB", "JO", "PS", "IN", "BY", "KZ", "MD", "UA", "AL", "BA", "HR", "ME", "MK", "RS", "SI", "KR", "BD", "PK", "LK", "GH", "KE", "NG", "TZ", "UG", "AG", "AM", "BS", "BB", "BZ", "BT", "BW", "BF", "CV", "CW", "DM", "FJ", "GM", "GE", "GD", "GW", "GY", "HT", "JM", "KI", "LS", "LR", "MW", "MV", "ML", "MH", "FM", "NA", "NR", "NE", "PW", "PG", "WS", "SM", "ST", "SN", "SC", "SL", "SB", "KN", "LC", "VC", "SR", "TL", "TO", "TT", "TV", "VU", "AZ", "BN", "BI", "KH", "CM", "TD", "KM", "GQ", "SZ", "GA", "GN", "KG", "LA", "MO", "MR", "MN", "NP", "RW", "TG", "UZ", "ZW", "BJ", "MG", "MU", "MZ", "AO", "CI", "DJ", "ZM", "CD", "CG", "IQ", "LY", "TJ", "VE", "ET", "XK"],
//        "external_urls": {
//          "spotify": "https://open.spotify.com/album/3cvjMNWg7t46NyDZzujfNg"
//        },
//        "href": "https://api.spotify.com/v1/albums/3cvjMNWg7t46NyDZzujfNg",
//        "id": "3cvjMNWg7t46NyDZzujfNg",
//        "images": [
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000b273cbb64bd416bb225456100bbc",
//            "height": 640,
//            "width": 640
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00001e02cbb64bd416bb225456100bbc",
//            "height": 300,
//            "width": 300
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00004851cbb64bd416bb225456100bbc",
//            "height": 64,
//            "width": 64
//          }
//        ],
//        "name": "Bach: Cello Suites Nos. 1, 5 & 6",
//        "release_date": "1983",
//        "release_date_precision": "year",
//        "type": "album",
//        "uri": "spotify:album:3cvjMNWg7t46NyDZzujfNg",
//        "artists": [
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/5aIqB5nVVvmFsvSdExz408"
//            },
//            "href": "https://api.spotify.com/v1/artists/5aIqB5nVVvmFsvSdExz408",
//            "id": "5aIqB5nVVvmFsvSdExz408",
//            "name": "Johann Sebastian Bach",
//            "type": "artist",
//            "uri": "spotify:artist:5aIqB5nVVvmFsvSdExz408"
//          },
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/5Dl3HXZjG6ZOWT5cV375lk"
//            },
//            "href": "https://api.spotify.com/v1/artists/5Dl3HXZjG6ZOWT5cV375lk",
//            "id": "5Dl3HXZjG6ZOWT5cV375lk",
//            "name": "Yo-Yo Ma",
//            "type": "artist",
//            "uri": "spotify:artist:5Dl3HXZjG6ZOWT5cV375lk"
//          }
//        ]
//      },
//      "artists": [
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/5aIqB5nVVvmFsvSdExz408"
//          },
//          "href": "https://api.spotify.com/v1/artists/5aIqB5nVVvmFsvSdExz408",
//          "id": "5aIqB5nVVvmFsvSdExz408",
//          "name": "Johann Sebastian Bach",
//          "type": "artist",
//          "uri": "spotify:artist:5aIqB5nVVvmFsvSdExz408"
//        },
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/5Dl3HXZjG6ZOWT5cV375lk"
//          },
//          "href": "https://api.spotify.com/v1/artists/5Dl3HXZjG6ZOWT5cV375lk",
//          "id": "5Dl3HXZjG6ZOWT5cV375lk",
//          "name": "Yo-Yo Ma",
//          "type": "artist",
//          "uri": "spotify:artist:5Dl3HXZjG6ZOWT5cV375lk"
//        }
//      ],
//      "available_markets": ["AR", "AU", "AT", "BE", "BO", "BR", "BG", "CA", "CL", "CO", "CR", "CY", "CZ", "DK", "DO", "DE", "EC", "EE", "SV", "FI", "FR", "GR", "GT", "HN", "HK", "HU", "IS", "IE", "IT", "LV", "LT", "LU", "MY", "MT", "MX", "NL", "NZ", "NI", "NO", "PA", "PY", "PE", "PH", "PL", "PT", "SG", "SK", "ES", "SE", "CH", "TW", "TR", "UY", "GB", "AD", "LI", "MC", "ID", "JP", "TH", "VN", "RO", "IL", "ZA", "SA", "AE", "BH", "QA", "OM", "KW", "EG", "MA", "DZ", "TN", "LB", "JO", "PS", "IN", "BY", "KZ", "MD", "UA", "AL", "BA", "HR", "ME", "MK", "RS", "SI", "KR", "BD", "PK", "LK", "GH", "KE", "NG", "TZ", "UG", "AG", "AM", "BS", "BB", "BZ", "BT", "BW", "BF", "CV", "CW", "DM", "FJ", "GM", "GE", "GD", "GW", "GY", "HT", "JM", "KI", "LS", "LR", "MW", "MV", "ML", "MH", "FM", "NA", "NR", "NE", "PW", "PG", "WS", "SM", "ST", "SN", "SC", "SL", "SB", "KN", "LC", "VC", "SR", "TL", "TO", "TT", "TV", "VU", "AZ", "BN", "BI", "KH", "CM", "TD", "KM", "GQ", "SZ", "GA", "GN", "KG", "LA", "MO", "MR", "MN", "NP", "RW", "TG", "UZ", "ZW", "BJ", "MG", "MU", "MZ", "AO", "CI", "DJ", "ZM", "CD", "CG", "IQ", "LY", "TJ", "VE", "ET", "XK"],
//      "disc_number": 1,
//      "duration_ms": 322306,
//      "explicit": false,
//      "external_ids": {
//        "isrc": "USSM18200540"
//      },
//      "external_urls": {
//        "spotify": "https://open.spotify.com/track/3sdrzlJmVJxQTC5gtfs4M4"
//      },
//      "href": "https://api.spotify.com/v1/tracks/3sdrzlJmVJxQTC5gtfs4M4",
//      "id": "3sdrzlJmVJxQTC5gtfs4M4",
//      "name": "Cello Suite No. 5 in C Minor, BWV 1011: II. Allemande",
//      "popularity": 40,
//      "preview_url": "https://p.scdn.co/mp3-preview/46d79196f46c8602aef83dc8135b3acd294e5240?cid=6046cf4a650c41f985b4ccf3ee4603e2",
//      "track_number": 8,
//      "type": "track",
//      "uri": "spotify:track:3sdrzlJmVJxQTC5gtfs4M4",
//      "is_local": false
//    },
//    {
//      "album": {
//        "album_type": "SINGLE",
//        "total_tracks": 5,
//        "available_markets": ["AR", "AU", "AT", "BE", "BO", "BR", "BG", "CA", "CL", "CO", "CR", "CY", "CZ", "DK", "DO", "DE", "EC", "EE", "SV", "FI", "FR", "GR", "GT", "HN", "HK", "HU", "IS", "IE", "IT", "LV", "LT", "LU", "MY", "MT", "MX", "NL", "NZ", "NI", "NO", "PA", "PY", "PE", "PH", "PL", "PT", "SG", "SK", "ES", "SE", "CH", "TW", "TR", "UY", "US", "GB", "AD", "LI", "MC", "ID", "JP", "TH", "VN", "RO", "IL", "ZA", "SA", "AE", "BH", "QA", "OM", "KW", "EG", "MA", "DZ", "TN", "LB", "JO", "PS", "IN", "BY", "KZ", "MD", "UA", "AL", "BA", "HR", "ME", "MK", "RS", "SI", "KR", "BD", "PK", "LK", "GH", "KE", "NG", "TZ", "UG", "AG", "AM", "BS", "BB", "BZ", "BT", "BW", "BF", "CV", "CW", "DM", "FJ", "GM", "GE", "GD", "GW", "GY", "HT", "JM", "KI", "LS", "LR", "MW", "MV", "ML", "MH", "FM", "NA", "NR", "NE", "PW", "PG", "WS", "SM", "ST", "SN", "SC", "SL", "SB", "KN", "LC", "VC", "SR", "TL", "TO", "TT", "TV", "VU", "AZ", "BN", "BI", "KH", "CM", "TD", "KM", "GQ", "SZ", "GA", "GN", "KG", "LA", "MO", "MR", "MN", "NP", "RW", "TG", "UZ", "ZW", "BJ", "MG", "MU", "MZ", "AO", "CI", "DJ", "ZM", "CD", "CG", "IQ", "LY", "TJ", "VE", "ET", "XK"],
//        "external_urls": {
//          "spotify": "https://open.spotify.com/album/5Oit2yRIGTqTegzWYjPl5j"
//        },
//        "href": "https://api.spotify.com/v1/albums/5Oit2yRIGTqTegzWYjPl5j",
//        "id": "5Oit2yRIGTqTegzWYjPl5j",
//        "images": [
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000b273522c80337583192efaea7882",
//            "height": 640,
//            "width": 640
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00001e02522c80337583192efaea7882",
//            "height": 300,
//            "width": 300
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00004851522c80337583192efaea7882",
//            "height": 64,
//            "width": 64
//          }
//        ],
//        "name": "Mabelle - EP",
//        "release_date": "2017-08-11",
//        "release_date_precision": "day",
//        "type": "album",
//        "uri": "spotify:album:5Oit2yRIGTqTegzWYjPl5j",
//        "artists": [
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/2dEZtPJFspWetycGtouit2"
//            },
//            "href": "https://api.spotify.com/v1/artists/2dEZtPJFspWetycGtouit2",
//            "id": "2dEZtPJFspWetycGtouit2",
//            "name": "Seth Ennis",
//            "type": "artist",
//            "uri": "spotify:artist:2dEZtPJFspWetycGtouit2"
//          }
//        ]
//      },
//      "artists": [
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/2dEZtPJFspWetycGtouit2"
//          },
//          "href": "https://api.spotify.com/v1/artists/2dEZtPJFspWetycGtouit2",
//          "id": "2dEZtPJFspWetycGtouit2",
//          "name": "Seth Ennis",
//          "type": "artist",
//          "uri": "spotify:artist:2dEZtPJFspWetycGtouit2"
//        }
//      ],
//      "available_markets": ["AR", "AU", "AT", "BE", "BO", "BR", "BG", "CA", "CL", "CO", "CR", "CY", "CZ", "DK", "DO", "DE", "EC", "EE", "SV", "FI", "FR", "GR", "GT", "HN", "HK", "HU", "IS", "IE", "IT", "LV", "LT", "LU", "MY", "MT", "MX", "NL", "NZ", "NI", "NO", "PA", "PY", "PE", "PH", "PL", "PT", "SG", "SK", "ES", "SE", "CH", "TW", "TR", "UY", "US", "GB", "AD", "LI", "MC", "ID", "JP", "TH", "VN", "RO", "IL", "ZA", "SA", "AE", "BH", "QA", "OM", "KW", "EG", "MA", "DZ", "TN", "LB", "JO", "PS", "IN", "BY", "KZ", "MD", "UA", "AL", "BA", "HR", "ME", "MK", "RS", "SI", "KR", "BD", "PK", "LK", "GH", "KE", "NG", "TZ", "UG", "AG", "AM", "BS", "BB", "BZ", "BT", "BW", "BF", "CV", "CW", "DM", "FJ", "GM", "GE", "GD", "GW", "GY", "HT", "JM", "KI", "LS", "LR", "MW", "MV", "ML", "MH", "FM", "NA", "NR", "NE", "PW", "PG", "WS", "SM", "ST", "SN", "SC", "SL", "SB", "KN", "LC", "VC", "SR", "TL", "TO", "TT", "TV", "VU", "AZ", "BN", "BI", "KH", "CM", "TD", "KM", "GQ", "SZ", "GA", "GN", "KG", "LA", "MO", "MR", "MN", "NP", "RW", "TG", "UZ", "ZW", "BJ", "MG", "MU", "MZ", "AO", "CI", "DJ", "ZM", "CD", "CG", "IQ", "LY", "TJ", "VE", "ET", "XK"],
//      "disc_number": 1,
//      "duration_ms": 171440,
//      "explicit": false,
//      "external_ids": {
//        "isrc": "USAN21600018"
//      },
//      "external_urls": {
//        "spotify": "https://open.spotify.com/track/7JJbiSK9OkQqfDaioahHw2"
//      },
//      "href": "https://api.spotify.com/v1/tracks/7JJbiSK9OkQqfDaioahHw2",
//      "id": "7JJbiSK9OkQqfDaioahHw2",
//      "name": "Fast Girl",
//      "popularity": 23,
//      "preview_url": "https://p.scdn.co/mp3-preview/2c27bff42fe3627b542811abd96a1823c5ee7be8?cid=6046cf4a650c41f985b4ccf3ee4603e2",
//      "track_number": 3,
//      "type": "track",
//      "uri": "spotify:track:7JJbiSK9OkQqfDaioahHw2",
//      "is_local": false
//    },
//    {
//      "album": {
//        "album_type": "SINGLE",
//        "total_tracks": 6,
//        "available_markets": [],
//        "external_urls": {
//          "spotify": "https://open.spotify.com/album/1SOhmJu5Xauc5OBspzl3hu"
//        },
//        "href": "https://api.spotify.com/v1/albums/1SOhmJu5Xauc5OBspzl3hu",
//        "id": "1SOhmJu5Xauc5OBspzl3hu",
//        "images": [
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000b273948b03cc15e26ee3f293e3c9",
//            "height": 640,
//            "width": 640
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00001e02948b03cc15e26ee3f293e3c9",
//            "height": 300,
//            "width": 300
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00004851948b03cc15e26ee3f293e3c9",
//            "height": 64,
//            "width": 64
//          }
//        ],
//        "name": "Phantom Of The Dance Floor (Remixes)",
//        "release_date": "2018-09-14",
//        "release_date_precision": "day",
//        "type": "album",
//        "uri": "spotify:album:1SOhmJu5Xauc5OBspzl3hu",
//        "artists": [
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/4zxvC7CRGvggq9EWXOpwAo"
//            },
//            "href": "https://api.spotify.com/v1/artists/4zxvC7CRGvggq9EWXOpwAo",
//            "id": "4zxvC7CRGvggq9EWXOpwAo",
//            "name": "Kiesza",
//            "type": "artist",
//            "uri": "spotify:artist:4zxvC7CRGvggq9EWXOpwAo"
//          }
//        ]
//      },
//      "artists": [
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/4zxvC7CRGvggq9EWXOpwAo"
//          },
//          "href": "https://api.spotify.com/v1/artists/4zxvC7CRGvggq9EWXOpwAo",
//          "id": "4zxvC7CRGvggq9EWXOpwAo",
//          "name": "Kiesza",
//          "type": "artist",
//          "uri": "spotify:artist:4zxvC7CRGvggq9EWXOpwAo"
//        },
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/4nBB1w8Yl5brdn4CGxqfMs"
//          },
//          "href": "https://api.spotify.com/v1/artists/4nBB1w8Yl5brdn4CGxqfMs",
//          "id": "4nBB1w8Yl5brdn4CGxqfMs",
//          "name": "Djemba Djemba",
//          "type": "artist",
//          "uri": "spotify:artist:4nBB1w8Yl5brdn4CGxqfMs"
//        }
//      ],
//      "available_markets": [],
//      "disc_number": 1,
//      "duration_ms": 203389,
//      "explicit": false,
//      "external_ids": {
//        "isrc": "GBB6K1800050"
//      },
//      "external_urls": {
//        "spotify": "https://open.spotify.com/track/3LZBxZMMwi8OxYhQ4FeqBj"
//      },
//      "href": "https://api.spotify.com/v1/tracks/3LZBxZMMwi8OxYhQ4FeqBj",
//      "id": "3LZBxZMMwi8OxYhQ4FeqBj",
//      "name": "Phantom Of The Dance Floor - Djemba Djemba Remix",
//      "popularity": 0,
//      "preview_url": null,
//      "track_number": 3,
//      "type": "track",
//      "uri": "spotify:track:3LZBxZMMwi8OxYhQ4FeqBj",
//      "is_local": false
//    },
//    {
//      "album": {
//        "album_type": "ALBUM",
//        "total_tracks": 9,
//        "available_markets": ["BN", "HK", "ID", "KH", "KR", "LA", "LK", "MO", "MY", "PH", "SG", "TH", "TW", "VN"],
//        "external_urls": {
//          "spotify": "https://open.spotify.com/album/4b6Si351g8brcy6TtHFn13"
//        },
//        "href": "https://api.spotify.com/v1/albums/4b6Si351g8brcy6TtHFn13",
//        "id": "4b6Si351g8brcy6TtHFn13",
//        "images": [
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000b273472c58102c67fd247d7707b6",
//            "height": 640,
//            "width": 640
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00001e02472c58102c67fd247d7707b6",
//            "height": 300,
//            "width": 300
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00004851472c58102c67fd247d7707b6",
//            "height": 64,
//            "width": 64
//          }
//        ],
//        "name": "Peace Is The Mission",
//        "release_date": "2015-06-01",
//        "release_date_precision": "day",
//        "type": "album",
//        "uri": "spotify:album:4b6Si351g8brcy6TtHFn13",
//        "artists": [
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/738wLrAtLtCtFOLvQBXOXp"
//            },
//            "href": "https://api.spotify.com/v1/artists/738wLrAtLtCtFOLvQBXOXp",
//            "id": "738wLrAtLtCtFOLvQBXOXp",
//            "name": "Major Lazer",
//            "type": "artist",
//            "uri": "spotify:artist:738wLrAtLtCtFOLvQBXOXp"
//          }
//        ]
//      },
//      "artists": [
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/738wLrAtLtCtFOLvQBXOXp"
//          },
//          "href": "https://api.spotify.com/v1/artists/738wLrAtLtCtFOLvQBXOXp",
//          "id": "738wLrAtLtCtFOLvQBXOXp",
//          "name": "Major Lazer",
//          "type": "artist",
//          "uri": "spotify:artist:738wLrAtLtCtFOLvQBXOXp"
//        },
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/4wHZkzWXD9GPr4RQAYjUcv"
//          },
//          "href": "https://api.spotify.com/v1/artists/4wHZkzWXD9GPr4RQAYjUcv",
//          "id": "4wHZkzWXD9GPr4RQAYjUcv",
//          "name": "Wild Belle",
//          "type": "artist",
//          "uri": "spotify:artist:4wHZkzWXD9GPr4RQAYjUcv"
//        }
//      ],
//      "available_markets": ["BN", "HK", "ID", "KH", "KR", "LA", "LK", "MO", "MY", "PH", "SG", "TH", "TW", "VN"],
//      "disc_number": 1,
//      "duration_ms": 233010,
//      "explicit": false,
//      "external_ids": {
//        "isrc": "QMUY41500009"
//      },
//      "external_urls": {
//        "spotify": "https://open.spotify.com/track/2q0AXsQItQRX4kAyY1PlBd"
//      },
//      "href": "https://api.spotify.com/v1/tracks/2q0AXsQItQRX4kAyY1PlBd",
//      "id": "2q0AXsQItQRX4kAyY1PlBd",
//      "name": "Be Together (feat. Wild Belle)",
//      "popularity": 28,
//      "preview_url": "https://p.scdn.co/mp3-preview/4c52f119886f9a67285a3656a341e0116e99ae82?cid=6046cf4a650c41f985b4ccf3ee4603e2",
//      "track_number": 1,
//      "type": "track",
//      "uri": "spotify:track:2q0AXsQItQRX4kAyY1PlBd",
//      "is_local": false
//    },
//    {
//      "album": {
//        "album_type": "ALBUM",
//        "total_tracks": 10,
//        "available_markets": ["AR", "AU", "AT", "BE", "BO", "BR", "BG", "CA", "CL", "CO", "CR", "CY", "CZ", "DK", "DO", "DE", "EC", "EE", "SV", "FI", "FR", "GR", "GT", "HN", "HK", "HU", "IS", "IE", "IT", "LV", "LT", "LU", "MY", "MT", "MX", "NL", "NZ", "NI", "NO", "PA", "PY", "PE", "PH", "PL", "PT", "SG", "SK", "ES", "SE", "CH", "TW", "TR", "UY", "US", "GB", "AD", "LI", "MC", "ID", "JP", "TH", "VN", "RO", "IL", "ZA", "SA", "AE", "BH", "QA", "OM", "KW", "EG", "MA", "DZ", "TN", "LB", "JO", "PS", "IN", "BY", "KZ", "MD", "UA", "AL", "BA", "HR", "ME", "MK", "RS", "SI", "KR", "BD", "PK", "LK", "GH", "KE", "NG", "TZ", "UG", "AG", "AM", "BS", "BB", "BZ", "BT", "BW", "BF", "CV", "CW", "DM", "FJ", "GM", "GE", "GD", "GW", "GY", "HT", "JM", "KI", "LS", "LR", "MW", "MV", "ML", "MH", "FM", "NA", "NR", "NE", "PW", "PG", "WS", "SM", "ST", "SN", "SC", "SL", "SB", "KN", "LC", "VC", "SR", "TL", "TO", "TT", "TV", "VU", "AZ", "BN", "BI", "KH", "CM", "TD", "KM", "GQ", "SZ", "GA", "GN", "KG", "LA", "MO", "MR", "MN", "NP", "RW", "TG", "UZ", "ZW", "BJ", "MG", "MU", "MZ", "AO", "CI", "DJ", "ZM", "CD", "CG", "IQ", "LY", "TJ", "VE", "ET", "XK"],
//        "external_urls": {
//          "spotify": "https://open.spotify.com/album/79adVMcMUNGN9Gw5qJI8JG"
//        },
//        "href": "https://api.spotify.com/v1/albums/79adVMcMUNGN9Gw5qJI8JG",
//        "id": "79adVMcMUNGN9Gw5qJI8JG",
//        "images": [
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000b27377315aee20fa8f9eb70f1cd8",
//            "height": 640,
//            "width": 640
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00001e0277315aee20fa8f9eb70f1cd8",
//            "height": 300,
//            "width": 300
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000485177315aee20fa8f9eb70f1cd8",
//            "height": 64,
//            "width": 64
//          }
//        ],
//        "name": "Blue Clear Sky",
//        "release_date": "1996-01-01",
//        "release_date_precision": "day",
//        "type": "album",
//        "uri": "spotify:album:79adVMcMUNGN9Gw5qJI8JG",
//        "artists": [
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/5vngPClqofybhPERIqQMYd"
//            },
//            "href": "https://api.spotify.com/v1/artists/5vngPClqofybhPERIqQMYd",
//            "id": "5vngPClqofybhPERIqQMYd",
//            "name": "George Strait",
//            "type": "artist",
//            "uri": "spotify:artist:5vngPClqofybhPERIqQMYd"
//          }
//        ]
//      },
//      "artists": [
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/5vngPClqofybhPERIqQMYd"
//          },
//          "href": "https://api.spotify.com/v1/artists/5vngPClqofybhPERIqQMYd",
//          "id": "5vngPClqofybhPERIqQMYd",
//          "name": "George Strait",
//          "type": "artist",
//          "uri": "spotify:artist:5vngPClqofybhPERIqQMYd"
//        }
//      ],
//      "available_markets": ["AR", "AU", "AT", "BE", "BO", "BR", "BG", "CA", "CL", "CO", "CR", "CY", "CZ", "DK", "DO", "DE", "EC", "EE", "SV", "FI", "FR", "GR", "GT", "HN", "HK", "HU", "IS", "IE", "IT", "LV", "LT", "LU", "MY", "MT", "MX", "NL", "NZ", "NI", "NO", "PA", "PY", "PE", "PH", "PL", "PT", "SG", "SK", "ES", "SE", "CH", "TW", "TR", "UY", "US", "GB", "AD", "LI", "MC", "ID", "JP", "TH", "VN", "RO", "IL", "ZA", "SA", "AE", "BH", "QA", "OM", "KW", "EG", "MA", "DZ", "TN", "LB", "JO", "PS", "IN", "BY", "KZ", "MD", "UA", "AL", "BA", "HR", "ME", "MK", "RS", "SI", "KR", "BD", "PK", "LK", "GH", "KE", "NG", "TZ", "UG", "AG", "AM", "BS", "BB", "BZ", "BT", "BW", "BF", "CV", "CW", "DM", "FJ", "GM", "GE", "GD", "GW", "GY", "HT", "JM", "KI", "LS", "LR", "MW", "MV", "ML", "MH", "FM", "NA", "NR", "NE", "PW", "PG", "WS", "SM", "ST", "SN", "SC", "SL", "SB", "KN", "LC", "VC", "SR", "TL", "TO", "TT", "TV", "VU", "AZ", "BN", "BI", "KH", "CM", "TD", "KM", "GQ", "SZ", "GA", "GN", "KG", "LA", "MO", "MR", "MN", "NP", "RW", "TG", "UZ", "ZW", "BJ", "MG", "MU", "MZ", "AO", "CI", "DJ", "ZM", "CD", "CG", "IQ", "LY", "TJ", "VE", "ET", "XK"],
//      "disc_number": 1,
//      "duration_ms": 256066,
//      "explicit": false,
//      "external_ids": {
//        "isrc": "USMC19648021"
//      },
//      "external_urls": {
//        "spotify": "https://open.spotify.com/track/7yQMZQeiSKnvEgimeGPVhi"
//      },
//      "href": "https://api.spotify.com/v1/tracks/7yQMZQeiSKnvEgimeGPVhi",
//      "id": "7yQMZQeiSKnvEgimeGPVhi",
//      "name": "I Can Still Make Cheyenne",
//      "popularity": 62,
//      "preview_url": null,
//      "track_number": 6,
//      "type": "track",
//      "uri": "spotify:track:7yQMZQeiSKnvEgimeGPVhi",
//      "is_local": false
//    },
//    {
//      "album": {
//        "album_type": "ALBUM",
//        "total_tracks": 14,
//        "available_markets": ["AR", "AU", "AT", "BE", "BO", "BR", "BG", "CA", "CL", "CO", "CR", "CY", "CZ", "DK", "DO", "DE", "EC", "EE", "SV", "FI", "FR", "GR", "GT", "HN", "HK", "HU", "IS", "IE", "IT", "LV", "LT", "LU", "MY", "MT", "MX", "NL", "NZ", "NI", "NO", "PA", "PY", "PE", "PH", "PL", "PT", "SG", "SK", "ES", "SE", "CH", "TW", "TR", "UY", "US", "GB", "AD", "LI", "MC", "ID", "JP", "TH", "VN", "RO", "IL", "ZA", "SA", "AE", "BH", "QA", "OM", "KW", "EG", "MA", "DZ", "TN", "LB", "JO", "PS", "IN", "BY", "KZ", "MD", "UA", "AL", "BA", "HR", "ME", "MK", "RS", "SI", "KR", "BD", "PK", "LK", "GH", "KE", "NG", "TZ", "UG", "AG", "AM", "BS", "BB", "BZ", "BT", "BW", "BF", "CV", "CW", "DM", "FJ", "GM", "GE", "GD", "GW", "GY", "HT", "JM", "KI", "LS", "LR", "MW", "MV", "ML", "MH", "FM", "NA", "NR", "NE", "PW", "PG", "WS", "SM", "ST", "SN", "SC", "SL", "SB", "KN", "LC", "VC", "SR", "TL", "TO", "TT", "TV", "VU", "AZ", "BN", "BI", "KH", "CM", "TD", "KM", "GQ", "SZ", "GA", "GN", "KG", "LA", "MO", "MR", "MN", "NP", "RW", "TG", "UZ", "ZW", "BJ", "MG", "MU", "MZ", "AO", "CI", "DJ", "ZM", "CD", "CG", "IQ", "LY", "TJ", "VE", "ET", "XK"],
//        "external_urls": {
//          "spotify": "https://open.spotify.com/album/7lxHnls3yQNl8B9bILmHj7"
//        },
//        "href": "https://api.spotify.com/v1/albums/7lxHnls3yQNl8B9bILmHj7",
//        "id": "7lxHnls3yQNl8B9bILmHj7",
//        "images": [
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000b273540fc1d083eac5bcff8dad21",
//            "height": 640,
//            "width": 640
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00001e02540fc1d083eac5bcff8dad21",
//            "height": 300,
//            "width": 300
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00004851540fc1d083eac5bcff8dad21",
//            "height": 64,
//            "width": 64
//          }
//        ],
//        "name": "Traveller",
//        "release_date": "2015-05-04",
//        "release_date_precision": "day",
//        "type": "album",
//        "uri": "spotify:album:7lxHnls3yQNl8B9bILmHj7",
//        "artists": [
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/4YLtscXsxbVgi031ovDDdh"
//            },
//            "href": "https://api.spotify.com/v1/artists/4YLtscXsxbVgi031ovDDdh",
//            "id": "4YLtscXsxbVgi031ovDDdh",
//            "name": "Chris Stapleton",
//            "type": "artist",
//            "uri": "spotify:artist:4YLtscXsxbVgi031ovDDdh"
//          }
//        ]
//      },
//      "artists": [
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/4YLtscXsxbVgi031ovDDdh"
//          },
//          "href": "https://api.spotify.com/v1/artists/4YLtscXsxbVgi031ovDDdh",
//          "id": "4YLtscXsxbVgi031ovDDdh",
//          "name": "Chris Stapleton",
//          "type": "artist",
//          "uri": "spotify:artist:4YLtscXsxbVgi031ovDDdh"
//        }
//      ],
//      "available_markets": ["AR", "AU", "AT", "BE", "BO", "BR", "BG", "CA", "CL", "CO", "CR", "CY", "CZ", "DK", "DO", "DE", "EC", "EE", "SV", "FI", "FR", "GR", "GT", "HN", "HK", "HU", "IS", "IE", "IT", "LV", "LT", "LU", "MY", "MT", "MX", "NL", "NZ", "NI", "NO", "PA", "PY", "PE", "PH", "PL", "PT", "SG", "SK", "ES", "SE", "CH", "TW", "TR", "UY", "US", "GB", "AD", "LI", "MC", "ID", "JP", "TH", "VN", "RO", "IL", "ZA", "SA", "AE", "BH", "QA", "OM", "KW", "EG", "MA", "DZ", "TN", "LB", "JO", "PS", "IN", "BY", "KZ", "MD", "UA", "AL", "BA", "HR", "ME", "MK", "RS", "SI", "KR", "BD", "PK", "LK", "GH", "KE", "NG", "TZ", "UG", "AG", "AM", "BS", "BB", "BZ", "BT", "BW", "BF", "CV", "CW", "DM", "FJ", "GM", "GE", "GD", "GW", "GY", "HT", "JM", "KI", "LS", "LR", "MW", "MV", "ML", "MH", "FM", "NA", "NR", "NE", "PW", "PG", "WS", "SM", "ST", "SN", "SC", "SL", "SB", "KN", "LC", "VC", "SR", "TL", "TO", "TT", "TV", "VU", "AZ", "BN", "BI", "KH", "CM", "TD", "KM", "GQ", "SZ", "GA", "GN", "KG", "LA", "MO", "MR", "MN", "NP", "RW", "TG", "UZ", "ZW", "BJ", "MG", "MU", "MZ", "AO", "CI", "DJ", "ZM", "CD", "CG", "IQ", "LY", "TJ", "VE", "ET", "XK"],
//      "disc_number": 1,
//      "duration_ms": 253200,
//      "explicit": false,
//      "external_ids": {
//        "isrc": "USUM71418084"
//      },
//      "external_urls": {
//        "spotify": "https://open.spotify.com/track/5jROdl6MhcmP3O7h2sVgtw"
//      },
//      "href": "https://api.spotify.com/v1/tracks/5jROdl6MhcmP3O7h2sVgtw",
//      "id": "5jROdl6MhcmP3O7h2sVgtw",
//      "name": "Parachute",
//      "popularity": 76,
//      "preview_url": null,
//      "track_number": 4,
//      "type": "track",
//      "uri": "spotify:track:5jROdl6MhcmP3O7h2sVgtw",
//      "is_local": false
//    },
//    {
//      "album": {
//        "album_type": "ALBUM",
//        "total_tracks": 13,
//        "available_markets": ["AD", "BE", "CH", "FR", "LU", "MC"],
//        "external_urls": {
//          "spotify": "https://open.spotify.com/album/6COj1d9FSFkmtWcocNko0b"
//        },
//        "href": "https://api.spotify.com/v1/albums/6COj1d9FSFkmtWcocNko0b",
//        "id": "6COj1d9FSFkmtWcocNko0b",
//        "images": [
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000b27303480df111e630f99026b52e",
//            "height": 640,
//            "width": 640
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00001e0203480df111e630f99026b52e",
//            "height": 300,
//            "width": 300
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000485103480df111e630f99026b52e",
//            "height": 64,
//            "width": 64
//          }
//        ],
//        "name": "Sous les jupes des filles (Original Motion Picture Soundtrack / Bonus Track Version)",
//        "release_date": "2016-04-08",
//        "release_date_precision": "day",
//        "type": "album",
//        "uri": "spotify:album:6COj1d9FSFkmtWcocNko0b",
//        "artists": [
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/74eY8wbrhhVD7pACbBHwHw"
//            },
//            "href": "https://api.spotify.com/v1/artists/74eY8wbrhhVD7pACbBHwHw",
//            "id": "74eY8wbrhhVD7pACbBHwHw",
//            "name": "Imany",
//            "type": "artist",
//            "uri": "spotify:artist:74eY8wbrhhVD7pACbBHwHw"
//          }
//        ]
//      },
//      "artists": [
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/74eY8wbrhhVD7pACbBHwHw"
//          },
//          "href": "https://api.spotify.com/v1/artists/74eY8wbrhhVD7pACbBHwHw",
//          "id": "74eY8wbrhhVD7pACbBHwHw",
//          "name": "Imany",
//          "type": "artist",
//          "uri": "spotify:artist:74eY8wbrhhVD7pACbBHwHw"
//        },
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/5NW2uPFatEKjZQ5gpWD8HO"
//          },
//          "href": "https://api.spotify.com/v1/artists/5NW2uPFatEKjZQ5gpWD8HO",
//          "id": "5NW2uPFatEKjZQ5gpWD8HO",
//          "name": "Filatov & Karas",
//          "type": "artist",
//          "uri": "spotify:artist:5NW2uPFatEKjZQ5gpWD8HO"
//        }
//      ],
//      "available_markets": ["AD", "BE", "CH", "FR", "LU", "MC"],
//      "disc_number": 1,
//      "duration_ms": 190000,
//      "explicit": false,
//      "external_ids": {
//        "isrc": "RUA591500339"
//      },
//      "external_urls": {
//        "spotify": "https://open.spotify.com/track/0ZBC6Eg6DjZRhgUmFdtzGH"
//      },
//      "href": "https://api.spotify.com/v1/tracks/0ZBC6Eg6DjZRhgUmFdtzGH",
//      "id": "0ZBC6Eg6DjZRhgUmFdtzGH",
//      "name": "Don't Be So Shy - Filatov & Karas Remix",
//      "popularity": 58,
//      "preview_url": "https://p.scdn.co/mp3-preview/dc9c7bb868978aaa3efd884c0d711627e2205d7e?cid=6046cf4a650c41f985b4ccf3ee4603e2",
//      "track_number": 13,
//      "type": "track",
//      "uri": "spotify:track:0ZBC6Eg6DjZRhgUmFdtzGH",
//      "is_local": false
//    },
//    {
//      "album": {
//        "album_type": "ALBUM",
//        "total_tracks": 12,
//        "available_markets": ["AR", "AU", "AT", "BE", "BO", "BR", "BG", "CA", "CL", "CO", "CR", "CY", "CZ", "DK", "DO", "DE", "EC", "EE", "SV", "FI", "FR", "GR", "GT", "HN", "HK", "HU", "IS", "IE", "IT", "LV", "LT", "LU", "MY", "MT", "MX", "NL", "NZ", "NI", "NO", "PA", "PY", "PE", "PH", "PL", "PT", "SG", "SK", "ES", "SE", "CH", "TW", "TR", "UY", "US", "GB", "AD", "LI", "MC", "ID", "JP", "TH", "VN", "RO", "IL", "ZA", "SA", "AE", "BH", "QA", "OM", "KW", "EG", "MA", "DZ", "TN", "LB", "JO", "PS", "IN", "BY", "KZ", "MD", "UA", "AL", "BA", "HR", "ME", "MK", "RS", "SI", "KR", "BD", "PK", "LK", "GH", "KE", "NG", "TZ", "UG", "AG", "AM", "BS", "BB", "BZ", "BT", "BW", "BF", "CV", "CW", "DM", "FJ", "GM", "GE", "GD", "GW", "GY", "HT", "JM", "KI", "LS", "LR", "MW", "MV", "ML", "MH", "FM", "NA", "NR", "NE", "PW", "PG", "WS", "SM", "ST", "SN", "SC", "SL", "SB", "KN", "LC", "VC", "SR", "TL", "TO", "TT", "TV", "VU", "AZ", "BN", "BI", "KH", "CM", "TD", "KM", "GQ", "SZ", "GA", "GN", "KG", "LA", "MO", "MR", "MN", "NP", "RW", "TG", "UZ", "ZW", "BJ", "MG", "MU", "MZ", "AO", "CI", "DJ", "ZM", "CD", "CG", "IQ", "LY", "TJ", "VE", "ET", "XK"],
//        "external_urls": {
//          "spotify": "https://open.spotify.com/album/1tuekzsMZQOuiMejKP6t2Y"
//        },
//        "href": "https://api.spotify.com/v1/albums/1tuekzsMZQOuiMejKP6t2Y",
//        "id": "1tuekzsMZQOuiMejKP6t2Y",
//        "images": [
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000b2739f0c014998bac13d3181474c",
//            "height": 640,
//            "width": 640
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00001e029f0c014998bac13d3181474c",
//            "height": 300,
//            "width": 300
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d000048519f0c014998bac13d3181474c",
//            "height": 64,
//            "width": 64
//          }
//        ],
//        "name": "Lady Wood",
//        "release_date": "2016-10-28",
//        "release_date_precision": "day",
//        "type": "album",
//        "uri": "spotify:album:1tuekzsMZQOuiMejKP6t2Y",
//        "artists": [
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/4NHQUGzhtTLFvgF5SZesLK"
//            },
//            "href": "https://api.spotify.com/v1/artists/4NHQUGzhtTLFvgF5SZesLK",
//            "id": "4NHQUGzhtTLFvgF5SZesLK",
//            "name": "Tove Lo",
//            "type": "artist",
//            "uri": "spotify:artist:4NHQUGzhtTLFvgF5SZesLK"
//          }
//        ]
//      },
//      "artists": [
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/4NHQUGzhtTLFvgF5SZesLK"
//          },
//          "href": "https://api.spotify.com/v1/artists/4NHQUGzhtTLFvgF5SZesLK",
//          "id": "4NHQUGzhtTLFvgF5SZesLK",
//          "name": "Tove Lo",
//          "type": "artist",
//          "uri": "spotify:artist:4NHQUGzhtTLFvgF5SZesLK"
//        }
//      ],
//      "available_markets": ["AR", "AU", "AT", "BE", "BO", "BR", "BG", "CA", "CL", "CO", "CR", "CY", "CZ", "DK", "DO", "DE", "EC", "EE", "SV", "FI", "FR", "GR", "GT", "HN", "HK", "HU", "IS", "IE", "IT", "LV", "LT", "LU", "MY", "MT", "MX", "NL", "NZ", "NI", "NO", "PA", "PY", "PE", "PH", "PL", "PT", "SG", "SK", "ES", "SE", "CH", "TW", "TR", "UY", "US", "GB", "AD", "LI", "MC", "ID", "JP", "TH", "VN", "RO", "IL", "ZA", "SA", "AE", "BH", "QA", "OM", "KW", "EG", "MA", "DZ", "TN", "LB", "JO", "PS", "IN", "BY", "KZ", "MD", "UA", "AL", "BA", "HR", "ME", "MK", "RS", "SI", "KR", "BD", "PK", "LK", "GH", "KE", "NG", "TZ", "UG", "AG", "AM", "BS", "BB", "BZ", "BT", "BW", "BF", "CV", "CW", "DM", "FJ", "GM", "GE", "GD", "GW", "GY", "HT", "JM", "KI", "LS", "LR", "MW", "MV", "ML", "MH", "FM", "NA", "NR", "NE", "PW", "PG", "WS", "SM", "ST", "SN", "SC", "SL", "SB", "KN", "LC", "VC", "SR", "TL", "TO", "TT", "TV", "VU", "AZ", "BN", "BI", "KH", "CM", "TD", "KM", "GQ", "SZ", "GA", "GN", "KG", "LA", "MO", "MR", "MN", "NP", "RW", "TG", "UZ", "ZW", "BJ", "MG", "MU", "MZ", "AO", "CI", "DJ", "ZM", "CD", "CG", "IQ", "LY", "TJ", "VE", "ET", "XK"],
//      "disc_number": 1,
//      "duration_ms": 204194,
//      "explicit": true,
//      "external_ids": {
//        "isrc": "SEUM71601583"
//      },
//      "external_urls": {
//        "spotify": "https://open.spotify.com/track/6s7PleW93OfE3YnujL9yxw"
//      },
//      "href": "https://api.spotify.com/v1/tracks/6s7PleW93OfE3YnujL9yxw",
//      "id": "6s7PleW93OfE3YnujL9yxw",
//      "name": "True Disaster",
//      "popularity": 52,
//      "preview_url": null,
//      "track_number": 4,
//      "type": "track",
//      "uri": "spotify:track:6s7PleW93OfE3YnujL9yxw",
//      "is_local": false
//    },
//    {
//      "album": {
//        "album_type": "SINGLE",
//        "total_tracks": 1,
//        "available_markets": ["AR", "AU", "AT", "BE", "BO", "BR", "BG", "CA", "CL", "CO", "CR", "CY", "CZ", "DK", "DO", "DE", "EC", "EE", "SV", "FI", "FR", "GR", "GT", "HN", "HK", "HU", "IS", "IE", "IT", "LV", "LT", "LU", "MY", "MT", "MX", "NL", "NZ", "NI", "NO", "PA", "PY", "PE", "PH", "PL", "PT", "SG", "SK", "ES", "SE", "CH", "TW", "TR", "UY", "US", "GB", "AD", "LI", "MC", "ID", "JP", "TH", "VN", "RO", "IL", "ZA", "SA", "AE", "BH", "QA", "OM", "KW", "EG", "MA", "DZ", "TN", "LB", "JO", "PS", "IN", "BY", "KZ", "MD", "UA", "AL", "BA", "HR", "ME", "MK", "RS", "SI", "KR", "BD", "PK", "LK", "GH", "KE", "NG", "TZ", "UG", "AG", "AM", "BS", "BB", "BZ", "BT", "BW", "BF", "CV", "CW", "DM", "FJ", "GM", "GE", "GD", "GW", "GY", "HT", "JM", "KI", "LS", "LR", "MW", "MV", "ML", "MH", "FM", "NA", "NR", "NE", "PW", "PG", "WS", "SM", "ST", "SN", "SC", "SL", "SB", "KN", "LC", "VC", "SR", "TL", "TO", "TT", "TV", "VU", "AZ", "BN", "BI", "KH", "CM", "TD", "KM", "GQ", "SZ", "GA", "GN", "KG", "LA", "MO", "MR", "MN", "NP", "RW", "TG", "UZ", "ZW", "BJ", "MG", "MU", "MZ", "AO", "CI", "DJ", "ZM", "CD", "CG", "IQ", "LY", "TJ", "VE", "ET", "XK"],
//        "external_urls": {
//          "spotify": "https://open.spotify.com/album/6j62lF3YXsygj6xTjAyRG5"
//        },
//        "href": "https://api.spotify.com/v1/albums/6j62lF3YXsygj6xTjAyRG5",
//        "id": "6j62lF3YXsygj6xTjAyRG5",
//        "images": [
//          {
//            "url": "https://i.scdn.co/image/ab67616d0000b2732c3fd06b0b185e346da9641f",
//            "height": 640,
//            "width": 640
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d00001e022c3fd06b0b185e346da9641f",
//            "height": 300,
//            "width": 300
//          },
//          {
//            "url": "https://i.scdn.co/image/ab67616d000048512c3fd06b0b185e346da9641f",
//            "height": 64,
//            "width": 64
//          }
//        ],
//        "name": "Sexual Healing (Kygo Remix)",
//        "release_date": "2015-04-27",
//        "release_date_precision": "day",
//        "type": "album",
//        "uri": "spotify:album:6j62lF3YXsygj6xTjAyRG5",
//        "artists": [
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/3koiLjNrgRTNbOwViDipeA"
//            },
//            "href": "https://api.spotify.com/v1/artists/3koiLjNrgRTNbOwViDipeA",
//            "id": "3koiLjNrgRTNbOwViDipeA",
//            "name": "Marvin Gaye",
//            "type": "artist",
//            "uri": "spotify:artist:3koiLjNrgRTNbOwViDipeA"
//          },
//          {
//            "external_urls": {
//              "spotify": "https://open.spotify.com/artist/23fqKkggKUBHNkbKtXEls4"
//            },
//            "href": "https://api.spotify.com/v1/artists/23fqKkggKUBHNkbKtXEls4",
//            "id": "23fqKkggKUBHNkbKtXEls4",
//            "name": "Kygo",
//            "type": "artist",
//            "uri": "spotify:artist:23fqKkggKUBHNkbKtXEls4"
//          }
//        ]
//      },
//      "artists": [
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/3koiLjNrgRTNbOwViDipeA"
//          },
//          "href": "https://api.spotify.com/v1/artists/3koiLjNrgRTNbOwViDipeA",
//          "id": "3koiLjNrgRTNbOwViDipeA",
//          "name": "Marvin Gaye",
//          "type": "artist",
//          "uri": "spotify:artist:3koiLjNrgRTNbOwViDipeA"
//        },
//        {
//          "external_urls": {
//            "spotify": "https://open.spotify.com/artist/23fqKkggKUBHNkbKtXEls4"
//          },
//          "href": "https://api.spotify.com/v1/artists/23fqKkggKUBHNkbKtXEls4",
//          "id": "23fqKkggKUBHNkbKtXEls4",
//          "name": "Kygo",
//          "type": "artist",
//          "uri": "spotify:artist:23fqKkggKUBHNkbKtXEls4"
//        }
//      ],
//      "available_markets": ["AR", "AU", "AT", "BE", "BO", "BR", "BG", "CA", "CL", "CO", "CR", "CY", "CZ", "DK", "DO", "DE", "EC", "EE", "SV", "FI", "FR", "GR", "GT", "HN", "HK", "HU", "IS", "IE", "IT", "LV", "LT", "LU", "MY", "MT", "MX", "NL", "NZ", "NI", "NO", "PA", "PY", "PE", "PH", "PL", "PT", "SG", "SK", "ES", "SE", "CH", "TW", "TR", "UY", "US", "GB", "AD", "LI", "MC", "ID", "JP", "TH", "VN", "RO", "IL", "ZA", "SA", "AE", "BH", "QA", "OM", "KW", "EG", "MA", "DZ", "TN", "LB", "JO", "PS", "IN", "BY", "KZ", "MD", "UA", "AL", "BA", "HR", "ME", "MK", "RS", "SI", "KR", "BD", "PK", "LK", "GH", "KE", "NG", "TZ", "UG", "AG", "AM", "BS", "BB", "BZ", "BT", "BW", "BF", "CV", "CW", "DM", "FJ", "GM", "GE", "GD", "GW", "GY", "HT", "JM", "KI", "LS", "LR", "MW", "MV", "ML", "MH", "FM", "NA", "NR", "NE", "PW", "PG", "WS", "SM", "ST", "SN", "SC", "SL", "SB", "KN", "LC", "VC", "SR", "TL", "TO", "TT", "TV", "VU", "AZ", "BN", "BI", "KH", "CM", "TD", "KM", "GQ", "SZ", "GA", "GN", "KG", "LA", "MO", "MR", "MN", "NP", "RW", "TG", "UZ", "ZW", "BJ", "MG", "MU", "MZ", "AO", "CI", "DJ", "ZM", "CD", "CG", "IQ", "LY", "TJ", "VE", "ET", "XK"],
//      "disc_number": 1,
//      "duration_ms": 368316,
//      "explicit": false,
//      "external_ids": {
//        "isrc": "USSM11409378"
//      },
//      "external_urls": {
//        "spotify": "https://open.spotify.com/track/7s1upm7yr7ZjrzXMwHawtG"
//      },
//      "href": "https://api.spotify.com/v1/tracks/7s1upm7yr7ZjrzXMwHawtG",
//      "id": "7s1upm7yr7ZjrzXMwHawtG",
//      "name": "Sexual Healing - Kygo Remix",
//      "popularity": 65,
//      "preview_url": "https://p.scdn.co/mp3-preview/ac38767f1ebe7afb2f64e5e03e25fd14f82484eb?cid=6046cf4a650c41f985b4ccf3ee4603e2",
//      "track_number": 1,
//      "type": "track",
//      "uri": "spotify:track:7s1upm7yr7ZjrzXMwHawtG",
//      "is_local": false
//    }
//  ]
//}
