//
//  TimerView.swift
//  Fineminton
//
//  Created by Theresia Saputri on 30/08/22.
//
import SwiftUI

struct TimerView: View {
    @EnvironmentObject var drillTimer: TimerViewModel
    @State var isPractice: Bool = false
    
    var body: some View {
        VStack(spacing: 50){
            ProgressRingView()
            drillButton.padding()
        }
        .onAppear(){
            drillTimer.progressCounter = 0.0
            print("counter: ", drillTimer.progressCounter)
        }
        .onReceive(drillTimer.timer) { _ in
            drillTimer.trackTime()
            print("time: ", drillTimer.remainingTime)
        }
    }
}

struct DrillTimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(TimerViewModel())
    }
}

extension TimerView{
    private var drillButton: some View{
        Button{
            if drillTimer.drillState == .notStarted{
                drillTimer.setDrillState(newDrillState: .drilling)
            }
            else {
                drillTimer.setDrillState(newDrillState: .notStarted)
            }
            print(drillTimer.drillState)
        }
        label:{
            Text(drillTimer.drillState == .notStarted ? "Mulai Latihan" : "Selesai Latihan")
                .fontWeight(.bold)
                .frame(width: 348, height: 47)
                .background(.blue)
                .foregroundColor(Color.white)
                .cornerRadius(8)
        }
    }
}

