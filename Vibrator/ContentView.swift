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
            
        }
        //        VStack {
        //            Button("Sharpness: 1, Intensity: 1, transient ") {
        //                object.complexSuccess(intensity: 1, sharpness: 1, type: .hapticTransient)
        //            }
        //            Button("Sharpness: 1, Intensity: 1, continous ") {
        //                object.complexSuccess(intensity: 1, sharpness: 1, type: .hapticContinuous, duration: 5)
        //            }
        //            Button("Sharpness: 0.5, Intensity: 0.5, transient ") {
        //                object.complexSuccess(intensity: 0.5, sharpness: 0.5, type: .hapticTransient)
        //            }
        //            Button("Sharpness: 0.5, Intensity: 0.5, continous ") {
        //                object.complexSuccess(intensity: 0.5, sharpness: 0.5, type: .hapticContinuous, duration: 5)
        //            }
        //
        //
        //
        //            Spacer()
        //            Button("Stop Engine") {
        //                object.stopEngine()
        //                object.prepareHaptics()
        //            }
        //        }
        //        .fullScreenCover(isPresented: $showSheet, content: {
        //            PurchaseView(showView: $showSheet)
        //        })
        //
        //        .onAppear(perform: object.prepareHaptics)
        //        .onAppear(perform: {
        //            if object.showedPurchase == false {
        //                showSheet.toggle()
        //            }
        //            object.showedPurchase = true
        //        })
        //        .padding()
        //    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
           
    }
}
