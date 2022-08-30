//
//  EndShotView.swift
//  FinemintonWatchApp WatchKit Extension
//
//  Created by Candra Winardi on 30/08/22.
//

import SwiftUI

struct EndShotView: View {
    @State var isShotView = false
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                
                Text("Clear/Lob Shot \n practice session has \n been done").font(.system(size: 17)).multilineTextAlignment(.center)
                
                Spacer()
                
                Button {
                    isShotView.toggle()
                } label: {
                    Text("Close")
                }.sheet(isPresented: $isShotView) {
                    ShotView()
                }
            }.navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Clear/Lob")
        }
    }
}

struct EndShotView_Previews: PreviewProvider {
    static var previews: some View {
        EndShotView()
    }
}
