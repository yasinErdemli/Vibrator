//
//  VibrationViewModel.swift
//  Vibrator
//
//  Created by Yasin Erdemli on 16.07.2023.
//

import Foundation
import CoreHaptics

class VibrationViewModel: ObservableObject {
    let hapticManager = Haptic.shared
    @Published var vibration = VibrationStruct(vibration: .fireplace, duration: 10, sampleRate: 60, strength: .light)
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
        vibrationPatternToPlay = nil
        let item = try? hapticManager.createPattern(strength: vibration.strength, pattern: vibration.vibration, duration: vibration.duration, sampleRate: vibration.sampleRate)
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
