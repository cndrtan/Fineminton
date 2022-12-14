//
//  ProgressRingView.swift
//  Fineminton
//
//  Created by Theresia Saputri on 30/08/22.
//

import SwiftUI

struct ProgressRingView: View {
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
            
            VStack(spacing: 30){
                Text("Set \(drillTimer.drillSet) dari 5")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(drillTimer.remainingTime)
                    .font(.system(size: 60))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                
                Text(drillTimer.title)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }
            
        }
        .frame(width: 340, height: 340)
        .padding()
    }
}

struct ProgressRingView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRingView()
            .environmentObject(TimerViewModel())
    }
}
