//
//  CoreHaptics.swift
//  Vibrator
//
//  Created by Yasin Erdemli on 22.06.2023.
//

import Foundation
import CoreHaptics
import SwiftUI

class Haptic{
    static let shared = Haptic()
    var engine: CHHapticEngine?
    var arrayOfVibrations : [CHHapticPattern] = []
    
    init() {
    }
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            return
        }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating Haptics: \(error.localizedDescription)")
        }
    }
    
    func stopEngine() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            return
        }
        
        Task {
            do {
                try await engine?.stop()
                engine = nil
                prepareHaptics()
            } catch {
                print("Failed to stop the engine: \(error.localizedDescription)")
            }
        }
    }
    
    func play(pattern: CHHapticPattern) {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play Patterns: \(error.localizedDescription)")
        }
        
    }
    
    func createPattern(pattern: Vibration = .fireplace, duration: Double = 10, sampleRate: Double = 60 ) throws -> CHHapticPattern {
        switch pattern {
        case .fireplace:
            return try createFireplaceBackgroundVibration(duration: duration, sampleRate: sampleRate)
        case .ocean:
            return try createOceanWavesBackgroundVibration(duration: duration, sampleRate: sampleRate)
        case .thunder:
            return try createThunderstormVibration(duration: duration , sampleRate: sampleRate)
        case .sunshine:
            return try createSunshineVibration(duration: duration, sampleRate: sampleRate)
        case .moon:
            return try createMoonlitNightVibration(duration: duration, sampleRate: sampleRate)
        case .snow:
            return try createWinterWindVibration(duration: duration, sampleRate: sampleRate)
        case .tornado:
            return try createRotatingWindVibration(duration: duration, sampleRate: sampleRate)
        case .sparkles:
            return try createSparkleVibration(duration: duration, sampleRate: sampleRate)
        case .breeze:
            return try createLeavesInWindVibration(duration: duration, sampleRate: sampleRate)
        }
    }
    
    private func createFireplaceBackgroundVibration(duration: Double = 10, sampleRate: Double = 60) throws -> CHHapticPattern {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { throw CHHapticError(.engineNotRunning)}

        var backgroundEvents: [CHHapticEvent] = []

        for t in stride(from: 0.0, to: duration, by: 1.0 / sampleRate) {
            let intensity = 0.4 + 0.2 * sin(2.0 * Double.pi * t / 10)
            let sharpness = 0.5

            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))

            let backgroundEvent = CHHapticEvent(eventType: .hapticTransient, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)

            backgroundEvents.append(backgroundEvent)
        }
        let firePattern = try! CHHapticPattern(events: backgroundEvents, parameters: [])
        
        return firePattern

    }
    
    private func createOceanWavesBackgroundVibration(duration: Double = 10, sampleRate: Double = 60) throws -> CHHapticPattern {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { throw CHHapticError(.engineNotRunning) }
        
        var backgroundEvents: [CHHapticEvent] = []

           let wavesDuration = duration // Duration for the ocean wave pattern
           let patternDuration = wavesDuration * 10 // Duration for the complete pattern

           for t in stride(from: 0.0, to: patternDuration, by: 1.0 / sampleRate) {
               let waveTime = t.truncatingRemainder(dividingBy: wavesDuration)
               let intensity = 0.4 + 0.2 * sin(2.0 * Double.pi * waveTime / 10)
               let sharpness = 0.5

               let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
               let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))

               let backgroundEvent = CHHapticEvent(eventType: .hapticTransient, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)

               backgroundEvents.append(backgroundEvent)
           }

        
        let oceanPattern = try! CHHapticPattern(events: backgroundEvents, parameters: [])
        return oceanPattern
    }
    
    private func createThunderstormVibration(duration: Double = 10, sampleRate: Double = 60) throws -> CHHapticPattern {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            throw CHHapticError(.engineNotRunning)
        }

        var backgroundEvents: [CHHapticEvent] = []

        let stormDuration = duration // Duration for the thunderstorm pattern
        let patternDuration = stormDuration * 10 // Duration for the complete pattern

        for t in stride(from: 0.0, to: patternDuration, by: 1.0 / sampleRate) {
            let stormTime = t.truncatingRemainder(dividingBy: stormDuration)
            let intensity = 0.8 + 0.4 * sin(2.0 * Double.pi * stormTime / 5)
            let sharpness = 1.0

            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))

            let backgroundEvent = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)

            backgroundEvents.append(backgroundEvent)
        }

        let thunderstormPattern = try! CHHapticPattern(events: backgroundEvents, parameters: [])
        return thunderstormPattern
    }
    
    private func createSunshineVibration(duration: Double = 10, sampleRate: Double = 60) throws -> CHHapticPattern {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            throw CHHapticError(.engineNotRunning)
        }

        var backgroundEvents: [CHHapticEvent] = []

        let sunshineDuration = duration // Duration for the sunshine pattern
        let patternDuration = sunshineDuration * 10 // Duration for the complete pattern

        for t in stride(from: 0.0, to: patternDuration, by: 1.0 / sampleRate) {
            let sunshineTime = t.truncatingRemainder(dividingBy: sunshineDuration)
            let intensity = 0.6 + 0.4 * sin(2.0 * Double.pi * sunshineTime / 8)
            let sharpness = 0.3

            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))

            let backgroundEvent = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)

            backgroundEvents.append(backgroundEvent)
        }

        let sunshinePattern = try! CHHapticPattern(events: backgroundEvents, parameters: [])
        return sunshinePattern
    }
    
    private func createMoonlitNightVibration(duration: Double = 10, sampleRate: Double = 60) throws -> CHHapticPattern {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            throw CHHapticError(.engineNotRunning)
        }

        var backgroundEvents: [CHHapticEvent] = []

        let nightDuration = duration // Duration for the moonlit night pattern
        let patternDuration = nightDuration * 10 // Duration for the complete pattern

        for t in stride(from: 0.0, to: patternDuration, by: 1.0 / sampleRate) {
            let nightTime = t.truncatingRemainder(dividingBy: nightDuration)
            let intensity = 0.2 + 0.1 * sin(2.0 * Double.pi * nightTime / 10)
            let sharpness = 0.1

            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))

            let backgroundEvent = CHHapticEvent(eventType: .hapticTransient, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)

            backgroundEvents.append(backgroundEvent)
        }

        let moonlitNightPattern = try! CHHapticPattern(events: backgroundEvents, parameters: [])
        return moonlitNightPattern
    }
    
    private func createWinterWindVibration(duration: Double = 10, sampleRate: Double = 60) throws -> CHHapticPattern {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            throw CHHapticError(.engineNotRunning)
        }

        var backgroundEvents: [CHHapticEvent] = []

        let winterDuration = duration // Duration for the winter wind pattern
        let patternDuration = winterDuration * 10 // Duration for the complete pattern

        for t in stride(from: 0.0, to: patternDuration, by: 1.0 / sampleRate) {
            let winterTime = t.truncatingRemainder(dividingBy: winterDuration)
            let intensity = 0.7 + 0.3 * sin(2.0 * Double.pi * winterTime / 6)
            let sharpness = 0.8

            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))

            let backgroundEvent = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)

            backgroundEvents.append(backgroundEvent)
        }

        let winterWindPattern = try! CHHapticPattern(events: backgroundEvents, parameters: [])
        return winterWindPattern
    }
    
    private func createRotatingWindVibration(duration: Double = 10, sampleRate: Double = 60) throws -> CHHapticPattern {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            throw CHHapticError(.engineNotRunning)
        }

        var backgroundEvents: [CHHapticEvent] = []

        let windDuration = duration // Duration for the rotating wind pattern
        let patternDuration = windDuration * 10 // Duration for the complete pattern

        for t in stride(from: 0.0, to: patternDuration, by: 1.0 / sampleRate) {
            let windTime = t.truncatingRemainder(dividingBy: windDuration)
            let intensity = 0.5 + 0.5 * sin(2.0 * Double.pi * windTime / 5)
            let sharpness = 0.7

            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))

            let backgroundEvent = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)

            backgroundEvents.append(backgroundEvent)
        }

        let rotatingWindPattern = try! CHHapticPattern(events: backgroundEvents, parameters: [])
        return rotatingWindPattern
    }
    
    private func createSparkleVibration(duration: Double = 10, sampleRate: Double = 60) throws -> CHHapticPattern {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            throw CHHapticError(.engineNotRunning)
        }

        var backgroundEvents: [CHHapticEvent] = []

        let sparkleDuration = duration // Duration for the sparkle pattern
        let patternDuration = sparkleDuration * 10 // Duration for the complete pattern

        for t in stride(from: 0.0, to: patternDuration, by: 1.0 / sampleRate) {
            let sparkleTime = t.truncatingRemainder(dividingBy: sparkleDuration)
            let intensity = 0.6 + 0.4 * sin(2.0 * Double.pi * sparkleTime / 4)
            let sharpness = 0.5

            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))

            let backgroundEvent = CHHapticEvent(eventType: .hapticTransient, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)

            backgroundEvents.append(backgroundEvent)
        }

        let sparklePattern = try! CHHapticPattern(events: backgroundEvents, parameters: [])
        return sparklePattern
    }
    
    private func createLeavesInWindVibration(duration: Double = 10, sampleRate: Double = 60) throws -> CHHapticPattern {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            throw CHHapticError(.engineNotRunning)
        }

        var backgroundEvents: [CHHapticEvent] = []

        let windDuration = duration // Duration for the leaves in wind pattern
        let patternDuration = windDuration * 10 // Duration for the complete pattern

        for t in stride(from: 0.0, to: patternDuration, by: 1.0 / sampleRate) {
            let windTime = t.truncatingRemainder(dividingBy: windDuration)
            let intensity = 0.4 + 0.3 * sin(2.0 * Double.pi * windTime / 6)
            let sharpness = 0.5

            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))

            let backgroundEvent = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)

            backgroundEvents.append(backgroundEvent)
        }

        let leavesInWindPattern = try! CHHapticPattern(events: backgroundEvents, parameters: [])
        return leavesInWindPattern
    }
    
    
}

enum Vibration: CaseIterable {
    case fireplace, ocean, thunder, sunshine, moon, snow, tornado, sparkles, breeze
    
    var icon: String {
        switch self {
        case .fireplace:
            return "flame"
        case .ocean:
            return "water.waves"
        case .thunder:
            return "bolt"
        case .sunshine:
            return "allergens"
        case .moon:
            return "moon.stars"
        case .snow:
            return "wind.snow"
        case .tornado:
            return "tornado"
        case .sparkles:
            return "sparkles"
        case .breeze:
            return "leaf"
        }
    }
    
    var height: CGFloat {
        switch self {
        case .fireplace, .thunder, .sunshine, .moon, .snow, .tornado, .sparkles:
            return 45
        case .ocean:
            return 36
        case .breeze:
            return 38
        
        }
    }
    
    var gradient: [Color] {
        switch self {
        case .fireplace:
            return [Color(red: 1, green: 165 / 255, blue: 30 / 255), Color(red: 189/255, green: 11/255, blue: 0)]
        case .ocean:
            return [Color(red: 75/255, green: 1, blue: 212/255), Color(red: 4/255, green: 69/255, blue: 144/255)]
        case .thunder:
            return [Color(red: 1, green: 214/255, blue: 0), Color(red: 1, green: 138/255, blue: 0)]
        case .sunshine:
            return [Color(red: 169/255, green: 99/255, blue: 1), Color(red: 112/255, green: 0, blue: 1)]
        case .moon:
            return [Color(hue: 0, saturation: 0, brightness: 1), Color(hue: 54/360, saturation: 0.86, brightness: 1)]
        case .snow:
            return [Color(hue: 194/360, saturation: 0.57, brightness: 1), Color(hue: 194/360, saturation: 0.07, brightness: 1)]
        case .tornado:
            return [Color(hue: 223/360, saturation: 0, brightness: 0.71), Color(hue: 223/360, saturation: 1, brightness: 0.92)]
        case .sparkles:
            return [Color(hue: 0, saturation: 0, brightness: 71/100), Color(hue: 281/360, saturation: 1, brightness: 92/100)]
        case .breeze:
           return [Color(hue: 94/360, saturation: 67/100, brightness: 86/100)]
        }
    }
}


