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
            Image(shot.shotImage)
                .resizable()
                .cornerRadius(8)
                .frame(width: 348, height: 188)
            
            RoundedRectangle(cornerRadius: 8)
                .stroke(.black, lineWidth: 0.15)
                .frame(width: 348, height: 188)
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [.clear, .white]), startPoint: .top, endPoint: .bottom))
            
            VStack(spacing: 5){
                Spacer()
                HStack{
                    Text(shot.shotName)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding([.top, .leading, .trailing])
                    Spacer()
                }
                HStack{
                    Text(shot.shotSummary)
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .padding([.leading, .bottom])
                    Spacer()
                }
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
