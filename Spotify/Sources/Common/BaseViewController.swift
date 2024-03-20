//
//  BaseViewController.swift
//  Spotify
//
//  Created by rauan on 3/19/24.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        addLanguageObserver()
    }
    
    
    private func setupNavBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationBarAppearance.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationBarAppearance.backgroundColor = .black
        
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.compactAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
    func setupLanguage() {
        
    }
    
    
    private func addLanguageObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(notifyLanguageChange),
            name: NSNotification.Name("languageObserver"),
            object: nil)
    }
    
    @objc
    private func notifyLanguageChange() {
        setupLanguage()
    }

    

}
