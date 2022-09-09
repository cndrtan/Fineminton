//
//  TutorialView.swift
//  Fineminton
//
//  Created by Yoppy Yunhasnawa on 26/08/22.
//

import SwiftUI

struct TutorialView: View {
    @StateObject private var viewModel: TutorialViewModel = TutorialViewModel()
    var body: some View {
        VStack {
            TabView {
                ForEach(self.viewModel.tutorialSteps) { step in
                    VideoPlayerView(data: step, stepsCount: self.viewModel.tutorialSteps.count).padding(.horizontal)
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }.padding(.top)
        .navigationTitle("Tutorial").navigationBarTitleDisplayMode(.inline)
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
            .previewInterfaceOrientation(.portrait)
    }
}
