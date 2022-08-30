//
//  ShotView.swift
//  FinemintonWatchApp WatchKit Extension
//
//  Created by Candra Winardi on 26/08/22.
//

import SwiftUI

struct ShotView: View {
    @State private var isShowTimerView = false
    
    var body: some View {
        List{
            Button {
                isShowTimerView.toggle()
            } label: {
                Text("Clear/Lob").padding(.top, 50).padding(.bottom, 10)
            }.sheet(isPresented: $isShowTimerView) {
                TimerView()
            }

            Button {
                isShowTimerView.toggle()
            } label: {
                Text("Smash").padding(.top, 50).padding(.bottom, 10)
            }.sheet(isPresented: $isShowTimerView) {
                TimerView()
            }

            Button {
                isShowTimerView.toggle()
            } label: {
                Text("Drop Shot").padding(.top, 50).padding(.bottom, 10)
            }.sheet(isPresented: $isShowTimerView) {
                TimerView()
            }
            
            Button {
                isShowTimerView.toggle()
            } label: {
                Text("Serve").padding(.top, 50).padding(.bottom, 10)
            }.sheet(isPresented: $isShowTimerView) {
                TimerView()
            }
        }.navigationBarTitleDisplayMode(.inline)
            .navigationTitle(Text("Choose Shot"))
    }
}

struct ShotView_Previews: PreviewProvider {
    static var previews: some View {
        ShotView()
    }
}
