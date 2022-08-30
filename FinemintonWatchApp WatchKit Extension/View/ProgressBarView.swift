//
//  ProgressBarView.swift
//  FinemintonWatchApp WatchKit Extension
//
//  Created by Candra Winardi on 26/08/22.
//

import SwiftUI

struct ProgressBarView: View {
    @Binding var progress: Float
    @Binding var color: Color
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.20)
                .foregroundColor(Color.gray)

            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 0.3), value: self.progress )
        }
    }
}

//struct ProgressBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressBarView()
//    }
//}
