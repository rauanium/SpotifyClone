//
//  SettingsViewController.swift
//  Spotify
//
//  Created by rauan on 3/1/24.
//

import UIKit
import SnapKit
import SwiftKeychainWrapper

class SettingsViewController: UIViewController {
    
    private var sections = [SectionModel]()
    private var keychainWrapper: KeychainWrapper = .standard
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
    }
    
    private func setupViews() {
        navigationItem.title = "Settings".localized
        view.backgroundColor = .mainBackground
        navigationItem.setBackBarItem()
        navigationController?.navigationBar.tintColor = .white
        
        view.addSubview(settingsTableView)
        
        settingsTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            
        }
    }
    
    private func setupData() {
        sections.append(.init(title: "Profile".localized, row: [.init(title: "View_your_profile".localized, handler: { [weak self] in
            DispatchQueue.main.async {
                self?.showProfilePage()
            }
        })]))
        
        sections.append(.init(title: "Account", row: [.init(title: "Sign_Out".localized, handler: { [weak self] in
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
        
        
        keychainWrapper.remove(forKey: "refreshToken")
        keychainWrapper.remove(forKey: "accessToken")
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
