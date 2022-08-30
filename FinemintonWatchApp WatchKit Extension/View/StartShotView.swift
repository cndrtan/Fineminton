//
//  StartShotView.swift
//  FinemintonWatchApp WatchKit Extension
//
//  Created by Candra Winardi on 30/08/22.
//

import SwiftUI

struct StartShotView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Text("Hello World")
            }.navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Clear/Lob")
        }
    }
}

struct StartShotView_Previews: PreviewProvider {
    static var previews: some View {
        StartShotView()
    }
}
