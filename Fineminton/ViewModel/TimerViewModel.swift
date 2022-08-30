//
//  TimerViewModel.swift
//  Fineminton
//
//  Created by Theresia Saputri on 30/08/22.
//
import Foundation
import SwiftUI

enum DrillState{
    case notStarted
    case drilling
    case resting
}

class TimerViewModel: ObservableObject{

    @Published var drillState: DrillState = .notStarted
    @Published var drillSet: Int = 1
    
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var counter: Double = 0.0
    
    @Published var remainingTime: String = "01:00"
    @Published var progressCounter: Double = 0.0
    @Published var remainedTime = 0.0
    
    @Published var ringColor: Color = .green
    
    var title: String{
        switch drillState{
        case .notStarted:
            return ""
        case .drilling:
            return "Sesi Latihan"
        case .resting:
            return "Sesi Istirahat"
        }
    }
    
    let drillDuration = 60
    let restDuration = 30
        
    func formatTime(time: CGFloat) -> String{
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = [.pad]
        return formatter.string(from: TimeInterval(time)) ?? "00:00"
    }
    
    func setDrillState(newDrillState: DrillState){
        drillState = newDrillState
        switch drillState {
        case .notStarted:
            timer.upstream.connect().cancel()
            remainedTime = Double(drillDuration)
            remainingTime = "01:00"
            progressCounter = 0.0
            drillSet = 1
        case .drilling:
            remainedTime = Double(drillDuration)
            timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            ringColor = .green
        case .resting:
            remainedTime = Double(restDuration)
            timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            ringColor = .blue
        }
    }
    
    func changeDrillSet(){
        self.drillSet = drillSet + 1
    }
    
    func trackTime(){
        if drillState == .drilling{
            if remainedTime > 0 {
                self.progressCounter = remainedTime / Double(drillDuration)
                self.remainingTime = formatTime(time: CGFloat(remainedTime))
                print ("drill time", remainingTime)
                self.remainedTime -= 1
            }
            else{
                if drillSet < 5{
                    setDrillState(newDrillState: .resting)
                    self.drillSet += 1
                }
                else{
                    setDrillState(newDrillState: .notStarted)
                    self.drillSet = 1
                }
            }
        }
        if drillState == .resting{
            if remainedTime > 0 {
                self.progressCounter = remainedTime / Double(drillDuration)
                self.remainingTime = formatTime(time: CGFloat(remainedTime))
                print ("drill time", remainingTime)
                self.remainedTime -= 1
            }
            else{
                setDrillState(newDrillState: .drilling)
            }
        }
            
    }
    
}

