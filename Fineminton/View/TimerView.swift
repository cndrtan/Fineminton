//
//  TimerView.swift
//  Fineminton
//
//  Created by Theresia Saputri on 30/08/22.
//
import SwiftUI

struct TimerView: View {
    @EnvironmentObject var drillTimer: TimerViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
           ZStack{
               Color(greyBackground).ignoresSafeArea()
               
               VStack(spacing: 50){
                   if drillTimer.drillState == .readying{
                       ReadyRingView()
                   }
                   else {
                       ProgressRingView()
                       drillButton.padding()
                   }
                   
               }
               
           }
           .onAppear(){
               drillTimer.progressCounter = 1
           }
           .onReceive(drillTimer.timer) { _ in
               drillTimer.trackTime()
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
                presentationMode.wrappedValue.dismiss()
            }
        }
        label:{
            Text(drillTimer.drillState == .notStarted ? "Mulai Latihan" : "Batalkan Latihan")
                .font(.system(size: 17))
                .fontWeight(.semibold)
                .frame(width: 348, height: 47)
                .background(orangeButton)
                .foregroundColor(Color.white)
                .cornerRadius(8)
        }
    }
}
