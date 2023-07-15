//
//  ContentView.swift
//  Vibrator
//
//  Created by Yasin Erdemli on 22.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet: Bool = false
    var body: some View {
        VStack {
            TabBarView(tabSelection: .vibration)
                .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
           
    }
}
