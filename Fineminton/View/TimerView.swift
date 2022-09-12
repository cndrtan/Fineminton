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
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""
    @State var showCancelAlert: Bool = false
    
    var body: some View {
           ZStack{
               Color(greyBackground).ignoresSafeArea()
               
               VStack(spacing: 50){
                   if drillTimer.drillState == .readying {
                       ReadyRingView()
                       emptyButton.padding()
                   }
                   else {
                       ProgressRingView()
                           .alert(isPresented: $drillTimer.showEndAlert, content: {
                               return Alert(title: Text("Selamat!"),
                                            message: Text("Sesi latihan Clear/Lob Shot telah selesai"),
                                            dismissButton: Alert.Button.default(
                                                Text("Oke"), action: {
                                                    drillTimer.setDrillState(newDrillState: .notStarted)
                                                    presentationMode.wrappedValue.dismiss()
                                                }
                                            )
                            )
                        }
                       )
                       drillButton
                           .padding()
                           .alert(isPresented:$showCancelAlert) {
                                       Alert(
                                           title: Text("Peringatan!"),
                                           message: Text("Apakah anda yakin ingin membatalkan latihan"),
                                           primaryButton: .cancel(Text("Tidak")),
                                           secondaryButton: .destructive(Text("Ya")) {
                                               drillTimer.setDrillState(newDrillState: .notStarted)
                                               presentationMode.wrappedValue.dismiss()
                                           }
                                       )
                            }
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
            self.showCancelAlert.toggle()
        }
        label:{
            Text("Batalkan Latihan")
                .font(.system(size: 17))
                .fontWeight(.semibold)
                .frame(width: 348, height: 47)
                .background(orangeButton)
                .foregroundColor(Color.white)
                .cornerRadius(8)
        }
        .alert(isPresented:$showCancelAlert) {
                    Alert(
                        title: Text("Peringatan!"),
                        message: Text("Apakah anda yakin ingin membatalkan latihan"),
                        primaryButton: .cancel(Text("Tidak")),
                        secondaryButton: .destructive(Text("Ya")) {
                            drillTimer.setDrillState(newDrillState: .notStarted)
                            presentationMode.wrappedValue.dismiss()
                        }
                )
         }
    }
    
    private var emptyButton: some View{
        Text("")
            .font(.system(size: 17))
            .fontWeight(.semibold)
            .frame(width: 348, height: 47)
            .background(Color(greyBackground).ignoresSafeArea())
            .foregroundColor(Color.white)
            .cornerRadius(8)
    }
    
}
