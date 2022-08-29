//
//  ChooseShotView.swift
//  Fineminton
//
//  Created by Theresia Saputri on 29/08/22.
//

import SwiftUI

struct ChooseShotView: View {

    @EnvironmentObject var shotViewModel: ShotViewModel
    var shots: [Shot] = ShotViewModel().shots
    
    var body: some View {
        NavigationView{
            ScrollView{
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
                            ShotItemView(shot: shot)
                        }
                    }
                    
                }
            }
            .padding(.top)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal){
                    HStack{
                        Text("Choose Shot")
                            .font(.largeTitle)
                            .bold()
                            .padding(.vertical)
                        Spacer()
                    }
                    
                }
            }
        }
    }
    
}

struct ChooseShotView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseShotView()
    }
}
