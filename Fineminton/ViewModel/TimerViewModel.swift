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
    
    @Published var ringColor: Color = .blue
    
    var title: String{
        switch drillState{
        case .notStarted:
            return "Sesi Latihan"
        case .drilling:
            return "Sesi Latihan"
        case .resting:
            return "Sesi Istirahat"
        case .readying:
            return "Sesi Mulai"
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
        case .readying:
            remainedTime = Double(3)
            timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            ringColor = .blue
        }
    }
    
    func changeDrillSet(){
        self.drillSet = drillSet + 1
    }
    
    func trackTime(){
        if drillState == .readying{
            if remainedTime > 1 {
                self.remainedTime -= 1
                self.progressCounter = remainedTime / Double(3)
                self.remainingTime = formatTime(time: CGFloat(remainedTime))
            } else{
                setDrillState(newDrillState: .drilling)
            }
        }
        
        if drillState == .drilling{
            if remainedTime >= 1 {
                self.progressCounter = remainedTime / Double(drillDuration)
                self.remainingTime = formatTime(time: CGFloat(remainedTime))
                print ("drill time", remainingTime)
                self.remainedTime -= 1
            }
                        
            else{
                AudioServicesPlaySystemSound(1005)
                if drillSet < 5{
                    setDrillState(newDrillState: .resting)
                }
                else{
                    setDrillState(newDrillState: .notStarted)
                    self.drillSet = 1
                }
            }
        }
        
        if drillState == .resting{
            if remainedTime >= 1  {
                self.progressCounter = remainedTime / Double(restDuration)
                self.remainingTime = formatTime(time: CGFloat(remainedTime))
                print ("drill time", remainingTime)
                self.remainedTime -= 1
            }
            else{
                self.drillSet += 1
                setDrillState(newDrillState: .drilling)
            }
        }
            
    }
    
}
