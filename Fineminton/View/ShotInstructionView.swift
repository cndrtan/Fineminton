//
//  ShotInstructionView.swift
//  Fineminton
//
//  Created by Theresia Saputri on 26/08/22.
//
import SwiftUI
import AVKit
import AVFoundation

struct ShotInstructionView: View {
    @EnvironmentObject var shotViewModel: ShotViewModel
    @EnvironmentObject var drillTimer: TimerViewModel
    @State private var isDrilling: Bool = false
    @State private var isViewDescription: Bool = false
    
    var shot: Shot
    
    var shotIndex: Int{
        shotViewModel.shots.firstIndex(where: {$0.id == shot.id})!
    }
    
    var body: some View {
        ZStack{
            darkGreyBackgound.ignoresSafeArea()
            
            VStack(spacing: 10){
                Spacer()
                PlayerView()
                    .frame(width: 345, height: 477).cornerRadius(10)
                
                HStack{
                    Text("SET & DURATION")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .padding(.leading, 25)
                    Spacer()
                }
                HStack{
                    Image("icon-racket")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .padding(.leading, 25)
                    Text("20 x 5 set")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    Spacer()
                }
                
                HStack{
                    Label("", systemImage: "stopwatch")
                        .labelStyle(.iconOnly)
                        .padding(.leading, 25)
                        .foregroundColor(.white)
                    
                    Text("1 menit / set")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        //.padding(.leading)
                    Spacer()
                }
                
                NavigationLink(destination: TutorialView()){
                    Text("Lihat Tutorial")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .frame(width: 345, height: 47)
                        .background(orangeButton)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.top)
                }
                
                Button{
                    isDrilling.toggle()
                } label:{
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(red: 0.937, green: 0.406, blue: 0.094), lineWidth: 2)
                            .frame(width: 345, height: 47)
                            .foregroundColor(.black)
                    
                        Text("Mulai Latihan")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                }
                .fullScreenCover(isPresented: $isDrilling){
                    TimerView()
                        .environmentObject(TimerViewModel())
                }
            }
            .navigationTitle(shot.shotName)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    isViewDescription.toggle()
                }
                label: {
                    Label("", systemImage: "info.circle")
                    .labelStyle(.iconOnly)
                    .foregroundColor(orangeButton)
                }
                .halfSheet(showSheet: $isViewDescription) {
                    ShotDescriptionView(isShown: self.$isViewDescription, title: .constant(shot.shotName), description: .constant(shot.shotDescription))
                } onEnd: {
                    
                    print("Dismissed")
                }
            }
        }
    }
}

struct ShotInstructionView_Previews: PreviewProvider {
    static let shotViewModel = ShotViewModel()
    
    static var previews: some View {
        ShotInstructionView(shot: shotViewModel.shots[0])
            .environmentObject(shotViewModel)
    }
}

struct PlayerView: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }

    func makeUIView(context: Context) -> UIView {
        return LoopingPlayerUIView(frame: .zero)
    }
}

class LoopingPlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Load the resource -> h
        let fileUrl = Bundle.main.url(forResource: "tahap_6_clear_shot_fast", withExtension: "mp4")!
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)
        // Setup the player
        let player = AVQueuePlayer()
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        // Create a new player looper with the queue player and template item
        playerLooper = AVPlayerLooper(player: player, templateItem: item)
        // Start the movie
        player.play()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}
