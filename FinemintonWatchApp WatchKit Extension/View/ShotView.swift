//
//  ShotView.swift
//  FinemintonWatchApp WatchKit Extension
//
//  Created by Candra Winardi on 26/08/22.
//

import SwiftUI

struct ShotView: View {
    @State private var isShowTimerView = false
    @EnvironmentObject var title: TitleSettings
    
    var body: some View {
        List{
            Button {
                isShowTimerView = true
                self.title.titleName = "Clear/Lob"
            } label: {
                Image("watch-5").resizable().frame(height: 60).padding(.top, 5)
                Text("Clear/Lob").padding(.bottom, 10)
            }.sheet(isPresented: $isShowTimerView) {
                TimerView()
            }

            Button {
                isShowTimerView = true
                self.title.titleName = "Smash"
            } label: {
                Image("watch-8").resizable().frame(height: 60).padding(.top, 5)
                Text("Smash").padding(.bottom, 10)
            }.sheet(isPresented: $isShowTimerView) {
                UnavailableView()
            }

            Button {
                isShowTimerView = true
                self.title.titleName = "Drop Shot"
            } label: {
                Image("watch-6").resizable().frame(height: 60).padding(.top, 5)
                Text("Drop").padding(.bottom, 10)
            }.sheet(isPresented: $isShowTimerView) {
                UnavailableView()
            }
            
            Button {
                isShowTimerView = true
                self.title.titleName = "Drive"
            } label: {
                Image("watch-7").resizable().frame(height: 60).padding(.top, 5)
                Text("Drive").padding(.bottom, 10)
            }.sheet(isPresented: $isShowTimerView) {
                UnavailableView()
            }
        }.navigationBarTitleDisplayMode(.inline)
            .navigationTitle(Text("Choose Shot"))
    }
}

struct ShotView_Previews: PreviewProvider {
    static var previews: some View {
        ShotView().environmentObject(TitleSettings())
    }
}
