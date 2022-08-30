//
//  TutorialView.swift
//  Fineminton
//
//  Created by Yoppy Yunhasnawa on 26/08/22.
//

import SwiftUI

struct TutorialView: View {
    var body: some View {
        NavigationView {
            TabView {
                VideoPlayerView().padding(.leading).padding(.trailing)
                VideoPlayerView().padding(.leading).padding(.trailing)
                VideoPlayerView().padding(.leading).padding(.trailing)
                VideoPlayerView().padding(.leading).padding(.trailing)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .navigationTitle("Tutorial")
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
            .previewInterfaceOrientation(.portrait)
    }
}
