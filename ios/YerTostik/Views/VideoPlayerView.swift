//
//  VideoPlayerView.swift
//  YerTostik
//
//  Created by Islam Temirbek on 5/6/18.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import AVFoundation

class VideoPlayerView: UIView {
    
    //MARK: - Properties
    private lazy var backroundDimView: UIView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        return imageView
    }()
    
    lazy var videoPlayer: AVPlayer = {
        let player = AVPlayer()
        player.volume = 0
        player.actionAtItemEnd = .none
        return player
    }()
    
    private lazy var videoPlayerLayer: AVPlayerLayer = {
        let playerLayer = AVPlayerLayer()
        return playerLayer
    }()
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpVideoBackground()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup backgorund Video
    func setUpVideoBackground() {
        guard let videoUrl = Bundle.main.url(forResource: Constant.videoFilename, withExtension: Constant.videoExtension) else { return }
        videoPlayer = AVPlayer(url: videoUrl)
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer)
        videoPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.backgroundColor = .clear
        self.layer.insertSublayer(videoPlayerLayer, at: 0)
        self.addSubview(backroundDimView)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: videoPlayer.currentItem)
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        videoPlayer.seek(to: kCMTimeZero)
        videoPlayer.play()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        videoPlayerLayer.frame = self.layer.bounds
        backroundDimView.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
    }
}
