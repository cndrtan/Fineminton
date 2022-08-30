//
//  TimerView.swift
//  FinemintonWatchApp WatchKit Extension
//
//  Created by Candra Winardi on 26/08/22.
//

import SwiftUI

struct TimerView: View {
    @State var progressValue: Float = 0.0
    //@State var seconds: String = "0"
    @StateObject private var vm = TimerViewModel()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var limitFormatter: DateFormatter {
        let fmtr = DateFormatter()
        fmtr.dateFormat = "ss"
        return fmtr
    }
    var body: some View {
        ZStack{
            ProgressBarView(progress: self.$progressValue).padding()
                .onAppear(){
                    self.progressValue = 0
                }
                .onReceive(timer){ _ in
                    self.progressValue = 0
                }
            
            Text("\(vm.time)")
                .fontWeight(.semibold).font(.system(size: 60))
                .onAppear(){
                    vm.startSeconds(seconds: 3.0)
                }
            
        }.onReceive(timer) { _ in
            vm.updateCountdownSeconds()
        }
        
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
