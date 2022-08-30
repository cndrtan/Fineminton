//
//  TimerView.swift
//  FinemintonWatchApp WatchKit Extension
//
//  Created by Candra Winardi on 26/08/22.
//

import SwiftUI

struct TimerView: View {
    @State var progressValue: Float = 1.0
    @State var count: Int = 3
    @State var isShowStartShotView = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        NavigationView{
            ZStack{
                Text("\(count)")
                    .fontWeight(.semibold).font(.system(size: 60))
                    .onReceive(timer, perform: { _ in
                        if count <= 1 {
                            count = 0
                        }else{
                            count -= 1
                        }
                    })
                
                ProgressBarView(progress: self.$progressValue).padding()
                    .onReceive(timer){ _ in
                        if count >= 1 {
                            self.progressValue -= 1/3
                        }else{
                            isShowStartShotView = true
                        }
                    }
                    .sheet(isPresented: $isShowStartShotView) {
                        StartShotView()
                    }
            }.navigationBarTitleDisplayMode(.inline)
                .navigationTitle(Text("Clear/Lob"))
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
