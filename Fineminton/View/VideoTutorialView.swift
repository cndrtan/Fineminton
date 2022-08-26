//
//  TutorialView.swift
//  Fineminton
//
//  Created by Yoppy Yunhasnawa on 26/08/22.
//

import SwiftUI
import AVKit

struct VideoTutorialView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                HStack() {
                    Text("Pergerakan Pukulan Lob/Clear").padding()
                    Spacer()
                }
                VideoPlayer(player: AVPlayer(url:  URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!))
                    .frame(height: 520).cornerRadius(10).padding()
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
                .padding()
            }
            .navigationTitle("Tutorial")
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        VideoTutorialView()
            .previewInterfaceOrientation(.portrait)
    }
}
