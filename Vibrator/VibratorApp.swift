//
//  VibratorApp.swift
//  Vibrator
//
//  Created by Yasin Erdemli on 22.06.2023.
//

import SwiftUI

@main
struct VibratorApp: App {
    var body: some Scene {
        WindowGroup {
            //            ContentView()
            //                .environmentObject(envObject)
            //        }
            TabBarView(tabSelection: .vibration)
                .preferredColorScheme(.dark)
        }
    }
}
