//
//  ChooseShotView.swift
//  Fineminton
//
//  Created by Theresia Saputri on 29/08/22.
//

import SwiftUI

struct ChooseShotView: View {

    @EnvironmentObject var shotViewModel: ShotViewModel
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""
    @State var showAlert: Bool = false
    var shots: [Shot] = ShotViewModel().shots
    
    init() {
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().barTintColor = greyBackground
            UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = .orange
        }

    var body: some View {
        NavigationView{
            ZStack{
                Color(greyBackground).ignoresSafeArea()
                ScrollView(showsIndicators: false){
                VStack(spacing: 30){
                    ForEach(shots){
                        shot in
                        if shot.isOpen{
                            NavigationLink(destination:ShotInstructionView(shot: shot))
                            {
                                ShotItemView(shot: shot)
                            }
                        }
                        else{
                            Button{
                                showAlert(title: String(localized: "Oops maaf"), message: String(localized: "Latihan ini belum tersedia"))
                            }label: {
                                ShotItemView(shot: shot)
                            }
                            .alert(isPresented: $showAlert, content: {
                                    return Alert(title: Text(alertTitle), message: Text(alertMessage))
                            })
                        }
                    }
                }
                }
                .navigationBarTitle("Practice Shot", displayMode: .large)
            }
            .navigationViewStyle(.stack)
        }.accentColor(orangeButton)
    }
    
    func showAlert(title: String, message: String){
        self.alertTitle =  title
        self.alertMessage = message
        showAlert.toggle()
    }
}

struct ChooseShotView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseShotView().preferredColorScheme(.dark)
    }
}
