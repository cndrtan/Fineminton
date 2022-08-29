//
//  ShotInstructionView.swift
//  Fineminton
//
//  Created by Theresia Saputri on 26/08/22.
//
import SwiftUI

import SwiftUI

struct ShotInstructionView: View {
    @EnvironmentObject var shotViewModel: ShotViewModel
    
    var shot: Shot
    
    var shotIndex: Int{
        shotViewModel.shots.firstIndex(where: {$0.id == shot.id})!
    }
    
    var body: some View {
        VStack{
            Image(shot.shotImage)
                .resizable()
                .ignoresSafeArea()
                .frame(width: 390, height: 200)
            
            ScrollView{
                VStack(spacing: 10){
                    HStack{
                        Text(shot.shotName)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.bottom)
                        Spacer()
                    }
                    
                    HStack{
                        Text("Deskripsi")
                            .font(.title3)
                        Spacer()
                    }
                    
                    Text(shot.shotDescription)
                        .font(.caption)
                    
                    HStack{
                        Text("Durasi")
                            .font(.title3)
                        Spacer()
                    }
                    
                    Text("Latihan ini meliputi 20 kali perulangan pukulan sebanyak 5 set. Anda akan diberikan waktu 1 menit pada setiap set untuk melakukan 20 kali pukulan clear.")
                        .font(.caption)
                
                    
                    HStack{
                        Text("Pada setiap set, anda akan diberikan waktu istirahat 30 detik.")
                            .font(.caption)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    HStack{
                        Text("Total waktu latihan:  7 menit 30 detik")
                            .font(.caption)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    Spacer()
                    nextButton
                        .padding(.top)
                        
                }.padding(.horizontal)
            }
            
            
            Spacer()
        }
    }
}

struct ShotInstructionView_Previews: PreviewProvider {
    static let shotViewModel = ShotViewModel()
    
    static var previews: some View {
        ShotInstructionView(shot: shotViewModel.shots[0])
            .environmentObject(shotViewModel)
    }
}

extension ShotInstructionView{
    private var nextButton: some View{
        Button{
            
        }
    label:{
        Text("Lanjut")
            .fontWeight(.bold)
            .frame(width: 348, height: 47)
            .background(.blue)
            .foregroundColor(Color.white)
            .cornerRadius(8)
    }
    }
}
