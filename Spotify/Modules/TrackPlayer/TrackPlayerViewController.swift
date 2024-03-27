//
//  TrackPlayerViewController.swift
//  Spotify
//
//  Created by rauan on 3/27/24.
//

import UIKit

class TrackPlayerViewController: UIViewController {
    
    private lazy var hideButton: UIButton = {
        let hideButton = UIButton()
        hideButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        hideButton.tintColor = .white
        hideButton.addTarget(self, action: #selector(didTapHide), for: .touchUpInside)
        return hideButton
    }()
    
    private lazy var trackTitleHeader = LabelFactory.createLabel(
        text: "All the stars",
        font: UIFont.systemFont(ofSize: 13, weight: .bold)
    )
    
    private lazy var coverImage = ImageFactory.createImage(
        contentMode: .scaleAspectFill,
        imageNamed: UIImage(named: "cover3")
    )
    
    private lazy var songAndLikeStack = StackFactory.createStack(
        axis: .horizontal,
        alignment: .fill,
        distribution: .equalSpacing
    )
    
    private lazy var titleAndArtistStack = StackFactory.createStack(
        spacing: 8,
        distribution: .fillProportionally
    )
    
    private lazy var trackTitle = LabelFactory.createLabel(
        text: "All the stars",
        font: UIFont.systemFont(ofSize: 21, weight: .bold)
    )
    
    private lazy var trackArtist = LabelFactory.createLabel(
        text: "Kendrik Lamar",
        textColor: .subtitle
    )
    
    private lazy var heartIcon = ImageFactory.createImage(
        contentMode: .scaleAspectFit,
        imageNamed: UIImage(systemName: "heart")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    )
    
    private lazy var trackSliderStack = StackFactory.createStack(
        distribution: .fillProportionally
    )
    
    private lazy var trackSlider: UISlider = {
        let trackSlider = UISlider()
        let configuration = UIImage.SymbolConfiguration(pointSize: 12)
        let thimbImage = UIImage(systemName: "circle.fill", withConfiguration: configuration)
        trackSlider.setThumbImage(thimbImage, for: .highlighted)
        trackSlider.setThumbImage(thimbImage, for: .normal)
        trackSlider.value = 0.0
        trackSlider.tintColor = .white
        return trackSlider
    }()
    
    private lazy var trackTimeStack = StackFactory.createStack(
        axis: .horizontal,
        distribution: .equalSpacing
        )
    
    private lazy var startTime = LabelFactory.createLabel(
        text: "0:00",
        font: UIFont.systemFont(ofSize: 12)
    )
    
    private lazy var finishTime = LabelFactory.createLabel(
        text: "4:44",
        font: UIFont.systemFont(ofSize: 12)
    )
    
    private lazy var trackControllersStack = StackFactory.createStack(
        axis: .horizontal,
        distribution: .equalSpacing
    )
    
    private lazy var previousButton: UIButton = {
        let previousButton = UIButton()
        previousButton.setImage(UIImage(systemName: "backward.end.fill"), for: .normal)
        previousButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 24), forImageIn: .normal)
        previousButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        previousButton.tintColor = .white
        previousButton.addTarget(self, action: #selector(didTapPrevious), for: .touchUpInside)
        return previousButton
    }()
    
    private lazy var playPauseButton: UIButton = {
        let playPauseButton = UIButton()
        playPauseButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        playPauseButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 56), forImageIn: .normal)
        playPauseButton.tintColor = .white
        playPauseButton.addTarget(self, action: #selector(didTapPlayPause), for: .touchUpInside)
        return playPauseButton
    }()
    
    private lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.setImage(UIImage(systemName: "forward.end.fill"), for: .normal)
        nextButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 24), forImageIn: .normal)
        nextButton.tintColor = .white
        nextButton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
        return nextButton
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: - Methods
    
    @objc
    private func didTapHide() {
        dismiss(animated: true)
    }
    
    @objc
    private func didTapPrevious() {
        print("previous")
    }
    
    @objc
    private func didTapPlayPause() {
        print("play pause")
    }
    
    @objc
    private func didTapNext() {
        print("next")
    }

}

//MARK: - SetupViews

extension TrackPlayerViewController {
    private func setupViews() {
        view.backgroundColor = .mainBackground
        
        [hideButton,
         trackTitleHeader,
         coverImage,
         songAndLikeStack,
         trackSliderStack,
         trackControllersStack].forEach {
            view.addSubview($0)
        }
        
        [titleAndArtistStack, heartIcon].forEach {
            songAndLikeStack.addArrangedSubview($0)
        }
        
        [trackTitle, trackArtist].forEach {
            titleAndArtistStack.addArrangedSubview($0)
        }
        
        [trackSlider, trackTimeStack].forEach {
            trackSliderStack.addArrangedSubview($0)
        }
        
        [startTime, finishTime].forEach {
            trackTimeStack.addArrangedSubview($0)
        }
        
        [previousButton, playPauseButton, nextButton].forEach {
            trackControllersStack.addArrangedSubview($0)
        }
        
        hideButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalToSuperview().inset(16)
            make.size.equalTo(24)
        }
        
        trackTitleHeader.snp.makeConstraints { make in
            make.top.equalTo(hideButton)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(hideButton)
        }
        
        coverImage.snp.makeConstraints { make in
            make.size.equalTo(340)
            make.top.equalTo(trackTitleHeader.snp.bottom).offset(80)
            make.centerX.equalToSuperview()
        }
        
        songAndLikeStack.snp.makeConstraints { make in
            make.top.equalTo(coverImage.snp.bottom).offset(56)
            make.bottom.equalTo(trackSliderStack.snp.top).offset(-36)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        heartIcon.snp.makeConstraints { make in
            make.size.equalTo(32)
        }
        
        trackSliderStack.snp.makeConstraints { make in
            make.top.equalTo(songAndLikeStack.snp.bottom).offset(52)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(trackControllersStack.snp.top).offset(-36)
        }
        
        trackTimeStack.snp.makeConstraints { make in
            make.height.equalTo(15)
        }
        
        trackControllersStack.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-36)
            make.left.right.equalToSuperview().inset(48)
            make.height.equalTo(62)
        }
    }
}
