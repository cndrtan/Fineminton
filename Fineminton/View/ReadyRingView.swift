//
//  ReadyRingView.swift
//  Fineminton
//
//  Created by Theresia Saputri on 07/09/22.
//

import SwiftUI

struct ReadyRingView: View {
    @EnvironmentObject private var drillTimer: TimerViewModel
    var body: some View {
        ZStack{
            Color(greyBackground).ignoresSafeArea()
            
            //default circle
            Circle()
                .inset(by: 10)
                .stroke(Color.gray, lineWidth: 30)
                .opacity(0.2)
                
            //progres circle
            Circle()
                .inset(by: 10)
                .trim(from: 0.0, to: min(drillTimer.progressCounter, 1.0))
                .stroke(drillTimer.ringColor, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .rotationEffect((Angle(degrees: 270.0)))
                .animation(.easeInOut(duration: 0.2), value: drillTimer.progressCounter)
            
            Text("\(Int(drillTimer.remainedTime))")
                .font(.system(size: 130))
                .fontWeight(.bold)
                .foregroundColor(.white)
            
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
