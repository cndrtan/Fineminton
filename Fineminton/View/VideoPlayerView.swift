//
//  VideoPlayerView.swift
//  Fineminton
//
//  Created by Yoppy Yunhasnawa on 30/08/22.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack() {
                    Text("Pergerakan Pukulan Lob/Clear")
                    Spacer()
                }
                VideoPlayer(player: AVPlayer(url:  URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!))
                    .frame(height: (geometry.size.height * 0.78)).cornerRadius(10)
                Button(action: {
                    print("sign up bin tapped")
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
            }.padding(.bottom)
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
