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
        NavigationView {
            TabView {
//                VideoPlayerView(data: self.viewModel.tutorialSteps[0]).padding(.horizontal)
//                VideoPlayerView(data: self.viewModel.tutorialSteps[1]).padding(.horizontal)
//                VideoPlayerView(data: self.viewModel.tutorialSteps[2]).padding(.horizontal)
//                VideoPlayerView(data: self.viewModel.tutorialSteps[3]).padding(.horizontal)
                ForEach(self.viewModel.tutorialSteps) { step in
                    VideoPlayerView(data: step).padding(.horizontal)
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .padding(.top)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal){
                    HStack{
                        Text("Tutorial")
                            .font(.largeTitle)
                            .bold()
                            .padding(.vertical)
                        Spacer()
                    }
                    
                }
            }
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
            .previewInterfaceOrientation(.portrait)
    }
}
