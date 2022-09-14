//
//  TimerViewModel.swift
//  Fineminton
//
//  Created by Theresia Saputri on 30/08/22.
//
import Foundation
import SwiftUI
import AVFoundation

enum DrillState{
    case notStarted
    case drilling
    case resting
    case readying
}

class TimerViewModel: ObservableObject{

    @Published var drillState: DrillState = .readying
    @Published var drillSet: Int = 1
    
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var counter: Double = 0.0
    @Published var remainingTime: String = "01:00"
    @Published var progressCounter: Double = 0.0
    @Published var remainedTime = 3.0
    
    @Published var ringColor: Color = greenRing ?? .green
    
    @Published var showEndAlert: Bool = false
    
    var title: String{
        switch drillState{
        case .notStarted:
            return String(localized: "Sesi Latihan")
        case .drilling:
            return String(localized: "Sesi Latihan")
        case .resting:
            return String(localized: "Sesi Istirahat")
        case .readying:
            return String(localized: "Sesi Mulai")
        }
    }
    
    let drillDuration = 60
    let restDuration = 30
    let readyDuration = 3
        
    func formatTime(time: CGFloat) -> String{
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = [.pad]
        return formatter.string(from: TimeInterval(time)) ?? "00:00"
    }
    
    func setDrillState(newDrillState: DrillState){
        self.drillState = newDrillState
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
            ringColor = greenRing ?? .green
        case .resting:
            remainedTime = Double(restDuration)
            timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            ringColor = blueRing ?? .blue
        case .readying:
            remainedTime = Double(readyDuration)
            timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            ringColor = greenRing ?? .green
        }
    }
    
    func changeDrillSet(){
        self.drillSet = drillSet + 1
    }
    
    func trackTime(){
        if drillState == .readying{
            if remainedTime > 1 {
                self.remainedTime -= 1
                self.progressCounter = remainedTime / Double(readyDuration)
                self.remainingTime = formatTime(time: CGFloat(remainedTime))
            } else{
                setDrillState(newDrillState: .drilling)
            }
        }
        
        if drillState == .drilling{
            if remainedTime >= 1 {
                self.progressCounter = remainedTime / Double(drillDuration)
                self.remainingTime = formatTime(time: CGFloat(remainedTime))
                self.remainedTime -= 1
            }
            else{
                if drillSet < 5{
                    AudioServicesPlaySystemSound(1005)
                    print("drill state:", drillState, "with remained time = ", remainedTime)
                    setDrillState(newDrillState: .resting)
                }
                else{
                    setDrillState(newDrillState: .notStarted)
                    self.showEndAlert = true
                }
            }
        }
        
        if drillState == .resting{
            if remainedTime >= 1  {
                self.progressCounter = remainedTime / Double(restDuration)
                self.remainingTime = formatTime(time: CGFloat(remainedTime))
                self.remainedTime -= 1
            }
            else{
                AudioServicesPlaySystemSound(1005)
                setDrillState(newDrillState: .drilling)
                self.drillSet += 1
            }
        }
            
    }
    
}
