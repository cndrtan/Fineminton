//
//  VideoPlayerView.swift
//  Fineminton
//
//  Created by Yoppy Yunhasnawa on 30/08/22.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    @State public var data: TutorialStep = TutorialStep()
    @State public var stepsCount: Int = 0
    @State private var isDrilling: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack() {
                    Text(self.data.titleWithSequence(stepsCount: self.stepsCount))
                    Spacer()
                }//.padding(.bottom)
                //                VideoPlayer(player: AVPlayer(url: URL(string: self.data.mediaSource)!))
                if self.data.mediaType == "video" {
                    VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: self.data.mediaSource, withExtension: "mp4")!))
                        .frame(height: (geometry.size.height * 0.65)).cornerRadius(10)
                }
                else {
                    Image(self.data.mediaSource).resizable().scaledToFit().frame(/*width: (geometry.size.width * 1),*/ height: (geometry.size.height * 0.65)).cornerRadius(10)
                }
                HStack() {
                    Text(self.data.description)
                        .multilineTextAlignment(.leading)//.font(.caption)
                    Spacer()
                }.padding(4)
                if self.data.showActionButton {
                    Button(action: {
                        isDrilling.toggle()
                    }) {
                        Text("Mulai Latihan")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(.system(size: 18))
                            .padding()
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                    .background(Color.blue)
                    .cornerRadius(10)
                    .fullScreenCover(isPresented: $isDrilling){
                        TimerView()
                            .environmentObject(TimerViewModel())
                    }
                }
            }
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
