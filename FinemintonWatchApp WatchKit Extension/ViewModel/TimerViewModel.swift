//
//  TimerViewModel.swift
//  FinemintonWatchApp WatchKit Extension
//
//  Created by Candra Winardi on 30/08/22.
//

import Foundation

class TimerViewModel: ObservableObject{
    @Published var isActive = false
    @Published var showingAlert = false
    @Published var time: String = "0"
    @Published var minutes: Float = 5.0 {
        didSet {
            self.time = "\(Int(minutes)):00"
        }
    }
    @Published var seconds: Float = 0.0 {
        didSet {
            self.time = "\(Int(seconds))"
        }
    }
    private var initialTime = 0
    private var endDate = Date()
    
    // Start the timer with the given amount of minutes
    func start(minutes: Float) {
        self.initialTime = Int(minutes)
        self.endDate = Date()
        self.isActive = true
        self.endDate = Calendar.current.date(byAdding: .minute, value: Int(minutes), to: endDate)!
    }
    
    // Start the timer with the given amount of seconds
    func startSeconds(seconds: Float) {
        self.initialTime = Int(seconds)
        self.endDate = Date()
        self.isActive = true
        self.endDate = Calendar.current.date(byAdding: .second, value: Int(seconds), to: endDate)!
    }
    
    // Reset the timer
    func reset() {
        self.minutes = Float(initialTime)
        self.isActive = false
        self.time = "\(Int(minutes)):00"
    }
    
    // Show updates of the timer
    func updateCountdown(){
        guard isActive else { return }
        
        // Gets the current date and makes the time difference calculation
        let now = Date()
        let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
        
        // Checks that the countdown is not <= 0
        if diff <= 0 {
            self.isActive = false
            self.time = "0:00"
            self.showingAlert = true
            return
        }
        
        // Turns the time difference calculation into sensible data and formats it
        let date = Date(timeIntervalSince1970: diff)
        let calendar = Calendar.current
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)

        // Updates the time string with the formatted time
        self.minutes = Float(minutes)
        self.time = String(format:"%d:%02d", minutes, seconds)
    }
    
    func updateCountdownSeconds(){
        guard isActive else { return }
        
        // Gets the current date and makes the time difference calculation
        let now = Date()
        let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
        
        // Checks that the countdown is not <= 0
        if diff <= 0 {
            self.isActive = false
            self.time = "0"
            self.showingAlert = true
            return
        }
        
        // Turns the time difference calculation into sensible data and formats it
        let date = Date(timeIntervalSince1970: diff)
        let calendar = Calendar.current
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)

        // Updates the time string with the formatted time
        self.minutes = Float(minutes)
        self.time = String(format:"%d", seconds)
    }
}
