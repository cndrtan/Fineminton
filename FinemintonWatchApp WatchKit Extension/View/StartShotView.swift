//
//  StartShotView.swift
//  FinemintonWatchApp WatchKit Extension
//
//  Created by Candra Winardi on 30/08/22.
//

import SwiftUI

struct StartShotView: View {
    @State var timeRemaining = 60
    @State var progressValue: Float = 1.0
    @State var practiceColor = Color("practiceColor")
    @State var restColor = Color("restColor")
    @State var isPractice = true
    @State var practiceSet = 1
    @State var isEndShotView = false
    @State var isStart = false
    @State var count: Int = 3
    
    @EnvironmentObject var title: TitleSettings
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let futureDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
    
    func convertSecondsToTime(timeInSeconds : Int) -> String{
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    var body: some View {
        NavigationView{
            if !isStart{
                ZStack{
                    Text("\(count)")
                        .fontWeight(.semibold).font(.system(size: 60))
                        .onReceive(timer, perform: { _ in
                            if count <= 1 {
                                count = 0
                            }else{
                                count -= 1
                            }
                        })
                    
                    ProgressBarView(progress: self.$progressValue, color: $practiceColor).padding()
                        .onReceive(timer){ _ in
                            if count >= 1 {
                                self.progressValue -= 1/3
                            }else{
                                self.progressValue = 1.0
                                isStart.toggle()
                            }
                        }
//                        .sheet(isPresented: $isShowStartShotView) {
//                            StartShotView()
//                        }
                }
            }else{
            ZStack{
                VStack{
                    
                    
                    Text("Set \(practiceSet) of 5").font(.system(size: 12))
                    Text("\(convertSecondsToTime(timeInSeconds:timeRemaining))").fontWeight(.bold).font(.system(size: 21))
                        .padding(.top, 15)
                        .padding(.bottom, 15)
                        .onReceive(timer) { time in
                            if timeRemaining < 1 {
                                timeRemaining = 0
                            }else{
                                timeRemaining -= 1
                            }
                        }
                    
                    if isPractice{
                        Text("Practice").font(.system(size: 11))
                    }else{
                        Text("Rest").font(.system(size: 11))
                    }
                }
                
                if isPractice {
                    ProgressBarView(progress: self.$progressValue, color: $practiceColor).padding()
                        .onReceive(timer) { _ in
                            if timeRemaining >= 1 {
                                self.progressValue -= 1/60
                            }else{
                                self.progressValue = 1.0
                                timeRemaining = 30
                                
                                if practiceSet >= 5{
                                    isEndShotView.toggle()
                                }else{
                                    isPractice.toggle()
                                }
                            }
                        }.sheet(isPresented: $isEndShotView) {
                            EndShotView()
                        }
                }else{
                    ProgressBarView(progress: self.$progressValue, color: $restColor).padding()
                        .onReceive(timer) { _ in
                            if timeRemaining >= 1 {
                                self.progressValue -= 1/30
                            }else{
                                self.progressValue = 1.0
                                timeRemaining = 60
                                practiceSet += 1
                                
                                isPractice.toggle()
                                
                            }
                        }
                }
                
            }.navigationBarTitleDisplayMode(.inline)
                .navigationTitle("\(self.title.titleName)")
            }
        }
    }
}

struct StartShotView_Previews: PreviewProvider {
    static var previews: some View {
        StartShotView().environmentObject(TitleSettings())
    }
}
