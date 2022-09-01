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
                isShowTimerView.toggle()
                self.title.titleName = "Clear/Lob"
            } label: {
                Text("Clear/Lob").padding(.top, 50).padding(.bottom, 10)
            }.sheet(isPresented: $isShowTimerView) {
                StartShotView()
            }

            Button {
                isShowTimerView.toggle()
                self.title.titleName = "Smash"
            } label: {
                Text("Smash").padding(.top, 50).padding(.bottom, 10)
            }.sheet(isPresented: $isShowTimerView) {
                StartShotView()
            }

            Button {
                isShowTimerView.toggle()
                self.title.titleName = "Drop Shot"
            } label: {
                Text("Drop Shot").padding(.top, 50).padding(.bottom, 10)
            }.sheet(isPresented: $isShowTimerView) {
                StartShotView()
            }
            
            Button {
                isShowTimerView.toggle()
                self.title.titleName = "Serve"
            } label: {
                Text("Serve").padding(.top, 50).padding(.bottom, 10)
            }.sheet(isPresented: $isShowTimerView) {
                StartShotView()
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
