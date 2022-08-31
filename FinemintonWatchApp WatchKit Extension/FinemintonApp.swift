//
//  FinemintonApp.swift
//  FinemintonWatchApp WatchKit Extension
//
//  Created by Candra Winardi on 22/08/22.
//

import SwiftUI

@main
struct FinemintonApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ShotView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
