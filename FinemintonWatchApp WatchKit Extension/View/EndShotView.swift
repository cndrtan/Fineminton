//
//  EndShotView.swift
//  FinemintonWatchApp WatchKit Extension
//
//  Created by Candra Winardi on 30/08/22.
//

import SwiftUI

struct EndShotView: View {
    @State var isShotView = false
    
    @EnvironmentObject var title: TitleSettings
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                
                Text("\(self.title.titleName) Shot \n practice session has \n been done").font(.system(size: 17)).multilineTextAlignment(.center)
                
                Spacer()
                
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                    title.isClose = true
                } label: {
                    Text("Close")
                }.buttonStyle(.plain).frame(width: 172, height: 44)
                .background(Color("orangeColor")).cornerRadius(30)
            }.navigationBarTitleDisplayMode(.inline)
                .navigationTitle("\(self.title.titleName)")
        }
    }
}

struct EndShotView_Previews: PreviewProvider {
    static var previews: some View {
        EndShotView().environmentObject(TitleSettings())
    }
}
