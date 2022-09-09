//
//  LoopingVideoPlayerView.swift
//  Fineminton
//
//  Created by Yoppy Yunhasnawa on 09/09/22.
//

import Foundation
import SwiftUI
import AVKit
import AVFoundation

private class LooperView : UIView {
    
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    private var player: AVQueuePlayer = AVQueuePlayer()
    
    private var videoFileName: String = ""
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Setup main video player
        self.initPlayer()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.playerLayer.frame = bounds
    }
    
    private func initPlayer() {
        self.playerLayer.player = self.player
        self.playerLayer.videoGravity = .resizeAspectFill
        
        // Add player to layer
        self.layer.addSublayer(playerLayer)
    }
    
    public func playMp4(fileName: String) {
        // Load video file as bundle
        let fileUrl = Bundle.main.url(forResource: fileName, withExtension: "mp4")!
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)
        
        // Create a new player looper with the queue player and template item
        self.playerLooper = AVPlayerLooper(player: self.player, templateItem: item)
        
        // Start the movie
        self.player.play()
    }
}

public struct LoopingVideoPlayerView: UIViewRepresentable {
    
    private var videoFileName: String = ""
    
    public init(_ videoFileName: String) {
        self.videoFileName = videoFileName
    }
    
    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LoopingVideoPlayerView>) {
    }

    public func makeUIView(context: Context) -> UIView {
        let looperView = LooperView(frame: .zero)
        looperView.playMp4(fileName: self.videoFileName)
        return looperView
    }
}
