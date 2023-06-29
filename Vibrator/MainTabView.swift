//
//  MainTabView.swift
//  Vibrator
//
//  Created by Yasin Erdemli on 23.06.2023.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            VibrationView()
                .tabItem {
                    Image("Vibration")
                        .resizable()
                        .frame(width: 35, height: 35)
                }
            
            HomeView()
                .tabItem {
                    Image("Home")
                        .resizable()
                        .frame(width: 35, height: 35)
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
