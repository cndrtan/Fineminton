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
    @State private var player: AVPlayer = AVPlayer()
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack() {
                    Text(self.data.titleWithSequence(stepsCount: self.stepsCount))
                    Spacer()
                }
                if self.data.mediaType == "video" {
                    LoopingVideoPlayerView(self.data.mediaSource)
                        .frame(height: (geometry.size.height * 0.65)).cornerRadius(10)
                }
                else {
                    Image(self.data.mediaSource).resizable().frame( height: (geometry.size.height * 0.65)).cornerRadius(10).aspectRatio(contentMode: .fit).scaledToFit()
                }
                HStack() {
                    Text(self.data.description)
                        .multilineTextAlignment(.leading)
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
                                    .stroke(Color.white, lineWidth: 0)
                            )
                    }
                    .background(ThemeColor(self.colorScheme).buttonColor)
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
