//
//  ShotItemView.swift
//  Fineminton
//
//  Created by Theresia Saputri on 29/08/22.
//

import SwiftUI

struct ShotItemView: View {
    var shot: Shot
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 348, height: 210)
                .foregroundColor(lightGreyBackgound)
            
            VStack(spacing: 5){
                Image(shot.shotImage)
                    .resizable()
                    .padding(.top)
                    .frame(width: 323, height: 160)
                
                HStack{
                    Text(shot.shotName)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding([.leading, .trailing])
                    Spacer()
                }
                
                HStack{
                    Text(shot.shotSummary)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding([.leading, .bottom])
                    Spacer()
                }
                .padding(.bottom)
            }.frame(width: 348, height: 188)
        }
    }
}

struct ShotItemView_Previews: PreviewProvider {
    static var shots = ShotViewModel().shots
    static var previews: some View {
        ShotItemView(shot: shots[0])
    }
}
