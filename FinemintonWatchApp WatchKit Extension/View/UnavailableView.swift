//
//  UnavailableView.swift
//  FinemintonWatchApp WatchKit Extension
//
//  Created by Candra Winardi on 06/09/22.
//

import SwiftUI

struct UnavailableView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            Spacer()
            Text("This feature is still in \n progress")
                .font(.system(size: 17)).multilineTextAlignment(.center)
            Spacer()
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Close")
            }.buttonStyle(.plain).frame(width: 172, height: 44)
            .background(Color("orangeColor")).cornerRadius(30)
            
        }
    }
}

struct UnavailableView_Previews: PreviewProvider {
    static var previews: some View {
        UnavailableView()
    }
}
