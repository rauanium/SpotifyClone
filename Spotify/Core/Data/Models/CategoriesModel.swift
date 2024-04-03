//
//  CategoriesModel.swift
//  Spotify
//
//  Created by rauan on 4/1/24.
//

import Foundation

struct CategoriesModel: Decodable {
    let categories: CategoriesItems
}

struct CategoriesItems: Decodable {
    let items: [SingleCategoryItem]
}

struct SingleCategoryItem: Decodable {
    let name: String
    let id: String
}
