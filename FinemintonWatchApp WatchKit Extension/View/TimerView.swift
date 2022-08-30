//
//  TimerView.swift
//  FinemintonWatchApp WatchKit Extension
//
//  Created by Candra Winardi on 26/08/22.
//

import SwiftUI

struct TimerView: View {
    @State var progressValue: Float = 0.0
    @State var count: Int = 3
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
                            self.progressValue += (1/3)
                        }
                    }
            }.navigationTitle("")
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
