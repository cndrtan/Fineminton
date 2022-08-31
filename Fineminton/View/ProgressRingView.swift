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
            //default circle
            Circle()
                .inset(by: 10)
                .stroke(Color.gray, lineWidth: 15)
                .opacity(0.2)
                
            //progres circle
            Circle()
                .inset(by: 10)
                .trim(from: 0.0, to: min(drillTimer.progressCounter, 1.0))
                .stroke(drillTimer.ringColor, style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .rotationEffect((Angle(degrees: 270.0)))
                .animation(.easeInOut(duration: 0.2), value: drillTimer.progressCounter)
            
            VStack(spacing: 20){
                HStack{
                    Text("Set ").fontWeight(.bold)
                    Text("\(drillTimer.drillSet)").fontWeight(.bold)
                }
                
                Text(drillTimer.remainingTime)
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                Text(drillTimer.title)
                    .fontWeight(.bold)
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
