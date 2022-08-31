//
//  ShotView.swift
//  FinemintonWatchApp WatchKit Extension
//
//  Created by Candra Winardi on 26/08/22.
//

import SwiftUI

struct ShotView: View {
    var body: some View {
        List{
            Button {
                
            } label: {
                Text("Clear/Lob").padding(.top, 50).padding(.bottom, 10)
            }

            Button {
                
            } label: {
                Text("Smash").padding(.top, 50).padding(.bottom, 10)
            }
            
            Button {
                
            } label: {
                Text("Drop Shot").padding(.top, 50).padding(.bottom, 10)
            }
            
            Button {
                
            } label: {
                Text("Serve").padding(.top, 50).padding(.bottom, 10)
            }
        }.navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Text("Choose Shot"))
    }
}

struct ShotView_Previews: PreviewProvider {
    static var previews: some View {
        ShotView()
    }
}
