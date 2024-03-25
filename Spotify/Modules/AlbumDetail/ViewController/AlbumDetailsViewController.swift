//
//  AlbumDetailViewController.swift
//  Spotify
//
//  Created by rauan on 3/20/24.
//

import UIKit
import SnapKit
import Kingfisher

class AlbumDetailsViewController: BaseViewController {
    var albumID: String?
    var viewModel: AlbumDetailsViewModel?
    private lazy var albumTracks: [AlbumTracksItem] = []{
        didSet{
            self.songsTableView.reloadData()
        }
    }
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    
    private lazy var albumCover = ImageFactory.createImage(
        width: 150,
        height: 150,
        imageNamed: UIImage(named: "cover3"),
        isSkeletonable: true
    )
    
    private let albumInfoStack = StackFactory.createStack(
        distribution: .fillEqually,
        isSkeletonable: true
    )
    
    private lazy var albumName = LabelFactory.createLabel(
        text: "All the Stars",
        font: UIFont.systemFont(ofSize: 28, weight: .bold),
        numberOfLines: 1,
        height: 30,
        isSkeletonable: true
    )
    
//    private lazy var albumDescription = LabelFactory.createLabel(
//        text: "The essential tracks, all in one playlist.",
//        font: UIFont.systemFont(ofSize: 13),
//        textColor: .subtitle,
//        numberOfLines: 1,
//        isSkeletonable: true
//    )
    
    private lazy var artistStack = StackFactory.createStack(
        axis: .horizontal,
        spacing: 8,
        alignment: .center,
        distribution: .fillProportionally,
        isSkeletonable: true
    )
    
    private lazy var artistCover = ImageFactory.createImage(
        contentMode: .scaleAspectFill,
        imageNamed: UIImage(named: "cover4"),
        isSkeletonable: true
    )
    
    private lazy var artistName = LabelFactory.createLabel(
        text: "Kendrik Lamar",
        font: UIFont.systemFont(ofSize: 13),
        numberOfLines: 1,
        isSkeletonable: true
    )
    
    private lazy var albumDuration = LabelFactory.createLabel(
        text: "2 hr 9 min",
        font: UIFont.systemFont(ofSize: 13),
        textColor: .subtitle,
        numberOfLines: 1,
        height: 20,
        isSkeletonable: true
    )
    
    private lazy var albumActionStack = StackFactory.createStack(
        axis: .horizontal,
        alignment: .center,
        distribution: .equalCentering,
        isSkeletonable: true
    )
    
    private lazy var albumIconStack = StackFactory.createStack(
        axis: .horizontal,
        alignment: .center,
        distribution: .fillProportionally,
        isSkeletonable: true
    )
    
    private lazy var favoriteImage = ImageFactory.createImage(
        contentMode: .scaleAspectFill,
        cornerRadius: 0,
        imageNamed: UIImage(systemName: "heart")?.withTintColor(.white, renderingMode: .alwaysOriginal),
        isSkeletonable: true
    )
    
    private lazy var shareImage = ImageFactory.createImage(
        contentMode: .scaleAspectFit,
        cornerRadius: 0,
        imageNamed: UIImage(systemName: "square.and.arrow.up")?.withTintColor(.white, renderingMode: .alwaysOriginal),
        isSkeletonable: true
    )

    private lazy var moreImage = ImageFactory.createImage(
        contentMode: .scaleAspectFit,
        cornerRadius: 0,
        imageNamed: UIImage(named: "optionsIcon"),
        isSkeletonable: true
    )
    
    private lazy var playPauseImage = ImageFactory.createImage(
        width: 56,
        height: 56,
        cornerRadius: 0,
        imageNamed: UIImage(named: "playImage"),
        isSkeletonable: true
    )
    
    private lazy var songsTableView: ContentSizedTableView = {
        let songsTableView = ContentSizedTableView()
        songsTableView.backgroundColor = .clear
        songsTableView.delegate = self
        songsTableView.dataSource = self
        songsTableView.register(AlbumSongsTableViewCell.self, forCellReuseIdentifier: AlbumSongsTableViewCell.identifier)
        songsTableView.separatorStyle = .none
        songsTableView.showsVerticalScrollIndicator = false
        return songsTableView
    }()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupGradient()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        resetNavigationBar()
    }
    
    private func setupViewModel() {
        viewModel = AlbumDetailsViewModel()
        guard let albumID else { return }
        viewModel?.loadAlbumDetails(id: albumID, completion: { [weak self] result in
            DispatchQueue.main.async {
//                self?.albumDescription.text = result.description
                let imageURL = URL(string: result.images.first?.url ?? "")
                self?.albumCover.kf.setImage(with: imageURL)
                self?.albumName.text = result.name
                self?.artistName.text = result.artists.first?.name
                var totalDuration = 0
                result.tracks.items.forEach { duration in
                    totalDuration += duration.durationMS
                }
                let totalTracks = result.totalTracks
                
                let h = totalDuration / 3600000
                let m = (totalDuration % 3600000) / 60000
                let s = ((totalDuration % 3600000) % 60000) / 1000
                if h != 0{
                    self?.albumDuration.text = " \(totalTracks) tracks • \(h)h \(m)m \(s)s"
                } else {
                    self?.albumDuration.text = "\(totalTracks) tracks • \(m)m \(s)s"
                }
                self?.albumTracks = result.tracks.items
                
                
            }
        })
    }
    
    //MARK: - Gradient
    private func setupGradient() {
        let firstColor = UIColor(
            red: 0.0/255,
            green: 128.0/255.0,
            blue: 174.0/255.0,
            alpha: 1.0).cgColor
        let secondColor = UIColor.mainBackground.cgColor
        
        let gradient = CAGradientLayer()
        gradient.colors = [firstColor, secondColor]
        gradient.locations = [0.0, 0.55]
        gradient.type = .axial
        gradient.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradient, at: 0)
        
    }
    
    //MARK: - SetupNavigation
    private func setupNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
    
        navigationBarAppearance.backgroundColor = .clear
        navigationBarAppearance.shadowColor = .clear
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(didTapBackButton))
        
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.compactAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
    private func resetNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationBarAppearance.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationBarAppearance.backgroundColor = .mainBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.compactAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
    @objc
    private func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - Setup Views
extension AlbumDetailsViewController {
    private func setupViews() {
        view.backgroundColor = .mainBackground
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
         
        [albumCover, albumInfoStack, albumActionStack, songsTableView].forEach {
            contentView.addSubview($0)
        }
        
        [albumName, artistStack, albumDuration].forEach {
            albumInfoStack.addArrangedSubview($0)
        }
        
        [artistCover, artistName].forEach {
            artistStack.addArrangedSubview($0)
        }
        
        [albumIconStack, playPauseImage].forEach {
            albumActionStack.addArrangedSubview($0)
        }
        
        [favoriteImage, shareImage, moreImage].forEach {
            albumIconStack.addArrangedSubview($0)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.bottom.equalToSuperview()
            
        }
        contentView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalTo(scrollView.snp.centerX)
        }
        
        albumCover.snp.makeConstraints { make in
            make.width.equalTo(220)
            make.height.equalTo(220)
        }
        artistCover.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
        
        artistCover.layer.cornerRadius = artistCover.frame.size.width / 2
        
        albumCover.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
        }
        
        albumInfoStack.snp.makeConstraints { make in
            make.top.equalTo(albumCover.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(120)
        }
        
        artistStack.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(40)
        }
        
        artistCover.snp.makeConstraints { make in
            make.width.equalTo(24)
        }
        
        albumActionStack.snp.makeConstraints { make in
            make.top.equalTo(albumInfoStack.snp.bottom)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(90)
        }
        
        albumIconStack.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(100)
            
        }
        playPauseImage.snp.makeConstraints { make in
            make.width.equalTo(56)
            make.height.equalTo(56)
        }
        favoriteImage.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        shareImage.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        moreImage.snp.makeConstraints { make in
            make.width.equalTo(18)
            make.height.equalTo(30)
        }
        
        songsTableView.snp.makeConstraints { make in
            make.top.equalTo(albumActionStack.snp.bottom)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
}

//MARK: - UITableViewDelegate DataSource

extension AlbumDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumTracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = songsTableView.dequeueReusableCell(withIdentifier: AlbumSongsTableViewCell.identifier,
                                                      for: indexPath) as! AlbumSongsTableViewCell
        let trackData = albumTracks[indexPath.row]
        cell.configure(data: trackData, index: indexPath.row + 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    
}
extension AlbumDetailsViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y < 280){
            navigationItem.title = ""
        }
        else {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
            
            navigationBarAppearance.backgroundColor = .clear
            navigationBarAppearance.shadowColor = .clear
            
            navigationController?.navigationBar.prefersLargeTitles = false
            navigationController?.navigationBar.standardAppearance = navigationBarAppearance
            navigationController?.navigationBar.compactAppearance = navigationBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
            navigationItem.title = albumName.text
            
            
        }
        
    }
    
    
}
