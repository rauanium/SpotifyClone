//
//  SettingsViewController.swift
//  Spotify
//
//  Created by rauan on 3/1/24.
//

import UIKit
import SnapKit
import SwiftKeychainWrapper

class SettingsViewController: BaseViewController {
    
    private var sections = [SectionModel]()
//    private var keychainWrapper: KeychainWrapper = .standard
    private var currentLanguage: SupportedLanguages? {
        didSet {
            guard let currentLanguage else { return }
            shouldChangeLanguage(language: currentLanguage)
        }
    }
    private lazy var settingsTableView: UITableView = {
        let settingsTableView = UITableView(frame: .zero, style: .grouped)
        settingsTableView.backgroundColor = .clear
        settingsTableView.dataSource = self
        settingsTableView.delegate = self
        settingsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "settingsCell")
        
        return settingsTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupViews()
        setupNavigation()
    }
    
    private func setupViews() {
        view.backgroundColor = .mainBackground
        view.addSubview(settingsTableView)
        
        settingsTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            
        }
    }
    override func setupLanguage() {
        navigationItem.title = "Settings".localized
        
    }
    
    private func setupNavigation() {
        navigationItem.title = "Settings".localized
        navigationItem.setBackBarItem()
        navigationController?.navigationBar.tintColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "globe"), style: .plain, target: self, action: #selector(didChangeLanugage))
    }
    
    @objc
    private func didChangeLanugage() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        SupportedLanguages.allLanguages.forEach { language in
            alert.addAction(
                .init(
                    title: language.localizedTitle,
                    style: .default,
                    handler: { [weak self] _ in
                        self?.currentLanguage = language
                    }
                ))
            
        }
        alert.addAction(
            .init(title: "Cancel".localized,
                  style: .cancel))
        self.present(alert, animated: true)
    }
    
    private func shouldChangeLanguage(language: SupportedLanguages) {
        Bundle.setLanguages(language: language.rawValue)
        DispatchQueue.main.async {
            NotificationCenter.default.post(
                name: NSNotification.Name("languageObserver"),
                object: nil)
        }
    }
    
    private func setupData() {
        sections.append(.init(title: "Profile".localized, row: [.init(title: "View_your_profile".localized, handler: { [weak self] in
            DispatchQueue.main.async {
                self?.showProfilePage()
            }
        })]))
        
        sections.append(.init(title: "Account".localized, row: [.init(title: "Sign_Out".localized, handler: { [weak self] in
            DispatchQueue.main.async {
                self?.didTapSignOut()
            }
        })]))
    }
    
    private func showProfilePage() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    private func didTapSignOut() {
        let welcomeViewController = WelcomeViewController()
        let welcomeNavigationController = UINavigationController(rootViewController: welcomeViewController)
        welcomeNavigationController.modalPresentationStyle = .fullScreen
        welcomeNavigationController.navigationBar.prefersLargeTitles = true
        welcomeNavigationController.viewControllers.first?.navigationItem.largeTitleDisplayMode = .always
        
        
        AuthManager.shared.removeTokens()
        self.present(welcomeNavigationController, animated: true) {
            self.navigationController?.popToRootViewController(animated: true)
        }
        
    }

}
extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].row.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath)
        let model = sections[indexPath.section].row[indexPath.row]
        cell.textLabel?.text = model.title
        cell.backgroundColor = .lightGray
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = sections[indexPath.section].row[indexPath.row]
        model.handler()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let modelTitle = sections[section].title
        
        return modelTitle
    }
     
}
