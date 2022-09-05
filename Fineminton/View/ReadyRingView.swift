//
//  ReadyRingView.swift
//  Fineminton
//
//  Created by Theresia Saputri on 05/09/22.
//

import SwiftUI

struct ReadyRingView: View {
    @EnvironmentObject private var drillTimer: TimerViewModel
    var body: some View {
        ZStack{
            //default circle
            Circle()
                .inset(by: 10)
                .stroke(Color.gray, lineWidth: 25)
                .opacity(0.2)
                
            //progres circle
            Circle()
                .inset(by: 10)
                .trim(from: 0.0, to: min(drillTimer.progressCounter, 1.0))
                .stroke(drillTimer.ringColor, style: StrokeStyle(lineWidth: 17.0, lineCap: .round, lineJoin: .round))
                .rotationEffect((Angle(degrees: 270.0)))
                .animation(.easeInOut(duration: 0.2), value: drillTimer.progressCounter)
            
            Text("\(Int(drillTimer.remainedTime))")
                .font(.system(size: 130))
                .fontWeight(.bold)
            
        }
        .frame(width: 340, height: 340)
        .padding()
    }
}

struct ReadyRingView_Previews: PreviewProvider {
    static var previews: some View {
        ReadyRingView()
            .environmentObject(TimerViewModel())
    }
}