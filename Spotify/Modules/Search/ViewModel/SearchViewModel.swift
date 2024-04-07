//
//  SearchViewModel.swift
//  Spotify
//
//  Created by rauan on 4/1/24.
//

import UIKit

class SearchViewModel {
    private lazy var sections = [CategorySection]()
    
    func getSectionViewModel(at section: Int) -> CategorySection {
        return sections[section]
    }
    
    func didLoad() {
        sections.append(.categoryItem(dataMode: []))
    }
    
    func loadCategories(completion: @escaping () -> ()) {
        var categoryItems: [CategorySectionModel] = []
        CategoriesManager.shared.getCategories { [weak self] result in
            switch result {
            case .success(let response):
                response.categories.items.forEach { singleItem in
                    categoryItems.append(.init(
                        categoryId: singleItem.id,
                        categoryTitle: singleItem.name,
                        color: self?.randomColor() ?? UIColor.alizarin))
                }
                
                self?.sections[0] = .categoryItem(dataMode: categoryItems)
                
                completion()
            case .failure(let error):
                print(error)
                completion()
            }
        }
    }
    
    func randomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    
//    func loadSearchedTracks(completion: @escaping () -> ()){
//        SearchManager.shared.getSearchedTracks(query: "runaway") {
//            
//            completion()
//        }
//    }
}
