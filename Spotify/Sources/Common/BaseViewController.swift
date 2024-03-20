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

        addLanguageObserver()
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
