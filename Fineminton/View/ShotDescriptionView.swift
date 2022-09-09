//
//  ShotDescriptionView.swift
//  Fineminton
//
//  Created by Theresia Saputri on 08/09/22.
//

import SwiftUI

struct ShotDescriptionView: View {
    @Binding var isShown: Bool
    @Binding var title: String
    @Binding var description: String
    
    var body: some View {
        NavigationView{
            ZStack{
                darkGreyBackgound.ignoresSafeArea()
                
                VStack(spacing: 15){
                    HStack{
                        Text("Deskripsi")
                            .font(.system(size: 21))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    
                    Text("\(description)")
                        .font(.system(size: 13))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                    
                    HStack{
                        Text("Durasi")
                            .font(.system(size: 21))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    
                    Text("Latihan ini meliputi 20 kali perulangan pukulan sebanyak 5 set. Anda akan diberikan waktu 1 menit pada setiap set untuk melakukan 20 kali pukulan clear.")
                        .font(.system(size: 13))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                    
                    HStack{
                        Text("Pada setiap set, anda akan diberikan waktu istirahat sebanyak 30 detik.")
                            .font(.system(size: 13))
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    
                    HStack{
                        Text("Total waktu latihan:  7 menit 30 detik")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    
                    Spacer()
                }
                .padding()
                .foregroundColor(.white)
            }
                .navigationTitle("\(title)")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button {
                        self.isShown.toggle()
                    } label: {
                        Text("Kembali")
                    }
                }
        }.accentColor(orangeButton)
    }
}

struct ShotDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ShotDescriptionView(isShown: .constant(false), title: .constant("Lob / Clear"), description: .constant("Jenis pukulan yang paling direkomendasikan untuk mengambil waktu dengan tujuan menengahkan lapangan adalah pukulan clear yang mendalam. Ketika anda bingung, pukulan clear bisa menjadi hal pertama yang anda lakukan. Pukulan clear yang digunakan untuk bertahan dapat disamakan dengan pukulan lob pada tenis.") )
    }
}
