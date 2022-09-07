//
//  ShotInstructionView.swift
//  Fineminton
//
//  Created by Theresia Saputri on 26/08/22.
//
import SwiftUI
import AVKit

struct ShotInstructionView: View {
    @EnvironmentObject var shotViewModel: ShotViewModel
    @State private var isDrilling: Bool = false
    @State private var isViewDescription: Bool = false
    
    var shot: Shot
    
    var shotIndex: Int{
        shotViewModel.shots.firstIndex(where: {$0.id == shot.id})!
    }
    
    var body: some View {
        ZStack{
            darkGreyBackgound.ignoresSafeArea()
            
            VStack(spacing: 10){
                Spacer()
                
                VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "tahap_6_clear_shot_fast", withExtension: "mp4")!))
                    .frame(width: 360, height: 477)
                    .cornerRadius(10)
                
                HStack{
                    Text("SET & DURATION")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .padding(.leading)
                    Spacer()
                }
                HStack{
                    Image("icon-racket")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .padding(.leading)
                    Text("20 x 5 set")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    Spacer()
                }
                
                HStack{
                    Label("", systemImage: "stopwatch")
                        .labelStyle(.iconOnly)
                        .padding(.leading)
                        .foregroundColor(.white)
                    
                    Text("1 menit / set")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        //.padding(.leading)
                    Spacer()
                }
                
                NavigationLink(destination: TutorialView()){
                    Text("Lihat Tutorial")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 47)
                        .background(orangeButton)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.top)
                }
                Button{
                    isDrilling.toggle()
                }label:{
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(red: 0.937, green: 0.406, blue: 0.094), lineWidth: 2)
                            .frame(width: 360, height: 47)
                            .foregroundColor(.black)
                    
                        Text("Mulai Latihan")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                }
                .fullScreenCover(isPresented: $isDrilling){
                    TimerView()
                        .environmentObject(TimerViewModel())
                }
            }
            .navigationTitle(shot.shotName)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    isViewDescription.toggle()
                }
                label: {
                    Label("", systemImage: "info.circle")
                    .labelStyle(.iconOnly)
                    .foregroundColor(orangeButton)
                }
            }
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
