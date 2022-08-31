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
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack() {
                    Text(self.data.title)
                    Spacer()
                }//.padding(.bottom)
                VideoPlayer(player: AVPlayer(url:  URL(string: self.data.videoURL)!))
                    .frame(height: (geometry.size.height * 0.65)).cornerRadius(10)
                Text(self.data.description)
                    .multilineTextAlignment(.leading)//.padding(.vertical)
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
            }
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
