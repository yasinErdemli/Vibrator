//
//  VibrationView.swift
//  Vibrator
//
//  Created by Yasin Erdemli on 23.06.2023.
//

import SwiftUI
import CoreHaptics


class VibrationViewModel: ObservableObject {
    let hapticManager = Haptic.shared
    @Published var vibration = VibrationStruct(vibration: .fireplace, duration: 10, sampleRate: 60)
    @Published var vibrationPatternToPlay: CHHapticPattern?
    @Published var showView: Bool = false
    @Published var isPlaying: Bool = false
    @Published var locked: Bool = false
    @Published var showSheet: Bool = false
    func prepareHaptics() {
        hapticManager.prepareHaptics()
    }
    
    init() {
        createVibration()
    }
    
    func createVibration() {
        let item = try? hapticManager.createPattern()
        vibrationPatternToPlay = item
        
    }
    func playVibration() {
        guard let pattern = vibrationPatternToPlay else { return }
        hapticManager.play(pattern: pattern)
    }
    
    func stopVibration() {
        hapticManager.stopEngine()
    }
}
struct VibrationView: View {
    @StateObject private var viewModel = VibrationViewModel()
    var body: some View {
        ZStack {
            WaveBackground().ignoresSafeArea()
            VStack {
                
                HStack {
                    Spacer()
                    
                    Image(systemName: viewModel.locked ? "lock.fill": "lock.open.fill")
                        .foregroundColor(.white)
                        .font(.title)
                }
                .padding(.trailing)
                .onTapGesture {
                    viewModel.locked.toggle()
                }
                .disabled(!viewModel.isPlaying)
                
                
                
                Spacer()
                Spacer()
                
                ZStack {
                    if viewModel.isPlaying {
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 31.2)
                                .foregroundStyle(
                                    Color("BackgroundColor").opacity(0.96).shadow(.inner(color: Color("ShadowColor"), radius: 6, x: 4, y: 4))
                                        .shadow(.inner(color: .white.opacity(0.06), radius: 6, x: -4, y: -4))
                                )
                                .blur(radius: 0.5)
                                .scaledToFill()
                                .frame(width: 155.92, height: 155.92)
                            
                            Circle()
                                .foregroundStyle(
                                    Color("BackgroundColor").opacity(0.96).shadow(.drop(color: Color("ShadowColor2").opacity(0.76), radius: 8, x: 4, y: 4))
                                        .shadow(.drop(color: .white.opacity(0.06), radius: 6, x: -4, y: -4))
                                )
                                .blur(radius: 0.5)
                                .frame(width: 124.72, height: 124.72)
                            
                            HStack(alignment: .center, spacing: 8) {
                                RoundedRectangle(cornerRadius: 3)
                                RoundedRectangle(cornerRadius: 3)
                            }
                            .foregroundColor(Color("PlayButtonColor"))
                            .frame(height: 47)
                            .frame(width: 31.71)
                        }
                        .onTapGesture {
                            viewModel.isPlaying.toggle()
                            viewModel.stopVibration()
                        }
                        .disabled(viewModel.locked)
                    } else {
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 31.2)
                                .foregroundStyle(
                                    Color("BackgroundColor").opacity(0.96).shadow(.drop(color: Color("ShadowColor"), radius: 6.4, x: 7, y: 7))
                                        .shadow(.drop(color: .white.opacity(0.01), radius: 2, x: -3, y: -3))
                                )
                                .blur(radius: 0.5)
                                .scaledToFill()
                                .frame(width: 155.92, height: 155.92)
                            
                            Circle()
                                .foregroundStyle(
                                    Color("BackgroundColor").opacity(0.96).shadow(.inner(color: Color("ShadowColor2").opacity(0.76), radius: 4.8, x: 7, y: 7))
                                        .shadow(.inner(color: .white.opacity(0.06), radius: 3.6, x: -3, y: -3))
                                )
                                .blur(radius: 0.5)
                                .frame(width: 124.72, height: 124.72)
                            
                            Image(systemName: "play.fill")
                                .resizable()
                                .foregroundColor(Color("PlayButtonColor"))
                                .frame(height: 47)
                                .frame(width: 42.24)
                                .offset(x: 5)
                        }
                        .onTapGesture {
                            viewModel.isPlaying.toggle()
                            viewModel.playVibration()
                        }
                    }
                }
                
                
                Button {
                    viewModel.showSheet.toggle()
                } label: {
                    ZStack {
                        
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(
                                Color("BackgroundColor").opacity(0.96).shadow(.drop(color: Color("ShadowColor2").opacity(0.8), radius: 0.5, x: 1, y: 1))
                                    .shadow(.drop(color: .white.opacity(0.1), radius: 0.5, x: -1, y: -1))
                            )
                            .frame(width: 118, height: 48, alignment: .center)
                        
                        
                        HStack(alignment: .center, spacing: 10) {
                            Text("Sets")
                                .font(.headline)
                            
                            Image(systemName: "gearshape")
                                .font(.headline)
                        }
                        .foregroundColor(.white)
                    }
                    .frame(width: 120, height: 50, alignment: .center)
                    .padding(.vertical, 78)
                    
                    
                }
                
                
                Spacer()
            }
            .padding(40)
            
            .frame(maxWidth: .infinity)
        }
        .onAppear {
            viewModel.prepareHaptics()
        }
        .animation(.easeOut(duration: 0.3), value: viewModel.isPlaying)
        .sheet(isPresented: $viewModel.showSheet) {
            PreferencesView(item: $viewModel.vibration)
                .presentationBackground(.ultraThinMaterial.opacity(0.5))
                .onDisappear {
                    viewModel.createVibration()
                }
        }
    }
}

struct VibrationView_Previews: PreviewProvider {
    static var previews: some View {
        VibrationView()
    }
}

struct VibrationStruct {
    var vibration: Vibration
    var duration: Double
    var sampleRate: Double
}



