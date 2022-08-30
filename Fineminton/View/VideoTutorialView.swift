//
//  TutorialView.swift
//  Fineminton
//
//  Created by Yoppy Yunhasnawa on 26/08/22.
//

import SwiftUI

struct VideoTutorialView: View {
    var body: some View {
        NavigationView {
            TabView {
                VideoPlayerView().padding()
                VideoPlayerView().padding()
                VideoPlayerView().padding()
                VideoPlayerView().padding()
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
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
