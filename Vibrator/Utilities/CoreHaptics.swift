//
//  CoreHaptics.swift
//  Vibrator
//
//  Created by Yasin Erdemli on 22.06.2023.
//

import Foundation
import CoreHaptics


class Haptic{
    static let shared = Haptic()
    var engine: CHHapticEngine?
    
    private init() {}
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
    
    func createPattern(strength: Strength = .medium, pattern: Vibration = .fireplace, duration: Double = 10, sampleRate: Double = 60) throws -> CHHapticPattern {
        switch pattern {
        case .fireplace:
            return try createFireplaceBackgroundVibration(strength: strength, duration: duration, sampleRate: sampleRate)
        case .ocean:
            return try createOceanWavesBackgroundVibration(strength: strength, duration: duration, sampleRate: sampleRate)
        case .thunder:
            return try createThunderstormVibration(strength: strength, duration: duration, sampleRate: sampleRate)
        case .sunshine:
            return try createSunshineVibration(strength: strength, duration: duration, sampleRate: sampleRate)
        case .moon:
            return try createMoonlitNightVibration(strength: strength, duration: duration, sampleRate: sampleRate)
        case .snow:
            return try createWinterWindVibration(strength: strength, duration: duration, sampleRate: sampleRate)
        case .tornado:
            return try createRotatingWindVibration(strength: strength, duration: duration, sampleRate: sampleRate)
        case .sparkles:
            return try createSparkleVibration(strength: strength, duration: duration, sampleRate: sampleRate)
        case .breeze:
            return try createLeavesInWindVibration(strength: strength, duration: duration, sampleRate: sampleRate)
        }
    }
    
    private func createFireplaceBackgroundVibration(strength: Strength, duration: Double = 10, sampleRate: Double = 60) throws -> CHHapticPattern {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            throw CHHapticError(.engineNotRunning)
        }

        var backgroundEvents: [CHHapticEvent] = []

        let intensityValues: [Double]
        switch strength {
        case .light:
            intensityValues = [0.2, 0.25, 0.3]
        case .medium:
            intensityValues = [0.4, 0.5, 0.6]
        case .hard:
            intensityValues = [0.6, 0.7, 0.8]
        }

        for t in stride(from: 0.0, to: duration, by: 1.0 / sampleRate) {
            let intensity = intensityValues[strength.rawValue] * sin(2.0 * Double.pi * t / 10)
            let sharpness = 0.5

            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))

            let backgroundEvent = CHHapticEvent(eventType: .hapticTransient, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)

            backgroundEvents.append(backgroundEvent)
        }

        let firePattern = try! CHHapticPattern(events: backgroundEvents, parameters: [])

        return firePattern
    }
    
    private func createOceanWavesBackgroundVibration(strength: Strength, duration: Double = 10, sampleRate: Double = 60) throws -> CHHapticPattern {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            throw CHHapticError(.engineNotRunning)
        }

        var backgroundEvents: [CHHapticEvent] = []

        let wavesDuration = duration // Duration for the ocean wave pattern
        let patternDuration = wavesDuration * 10 // Duration for the complete pattern

        let intensityValues: [Double]
        switch strength {
        case .light:
            intensityValues = [0.2, 0.25, 0.3]
        case .medium:
            intensityValues = [0.4, 0.5, 0.6]
        case .hard:
            intensityValues = [0.6, 0.7, 0.8]
        }

        for t in stride(from: 0.0, to: patternDuration, by: 1.0 / sampleRate) {
            let waveTime = t.truncatingRemainder(dividingBy: wavesDuration)
            let intensity = intensityValues[strength.rawValue] * sin(2.0 * Double.pi * waveTime / 10)
            let sharpness = 0.5

            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))

            let backgroundEvent = CHHapticEvent(eventType: .hapticTransient, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)

            backgroundEvents.append(backgroundEvent)
        }

        let oceanPattern = try! CHHapticPattern(events: backgroundEvents, parameters: [])
        return oceanPattern
    }
    
    private func createThunderstormVibration(strength: Strength, duration: Double = 10, sampleRate: Double = 60) throws -> CHHapticPattern {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            throw CHHapticError(.engineNotRunning)
        }

        var backgroundEvents: [CHHapticEvent] = []

        let stormDuration = duration // Duration for the thunderstorm pattern
        let patternDuration = stormDuration * 10 // Duration for the complete pattern

        let intensityValues: [Double]
        switch strength {
        case .light:
            intensityValues = [0.2, 0.25, 0.3]
        case .medium:
            intensityValues = [0.4, 0.5, 0.6]
        case .hard:
            intensityValues = [0.6, 0.7, 0.8]
        }

        for t in stride(from: 0.0, to: patternDuration, by: 1.0 / sampleRate) {
            let stormTime = t.truncatingRemainder(dividingBy: stormDuration)
            let intensity = intensityValues[strength.rawValue] * sin(2.0 * Double.pi * stormTime / 5)
            let sharpness = 1.0

            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))

            let backgroundEvent = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)

            backgroundEvents.append(backgroundEvent)
        }

        let thunderstormPattern = try! CHHapticPattern(events: backgroundEvents, parameters: [])
        return thunderstormPattern
    }
    private func createSunshineVibration(strength: Strength, duration: Double = 10, sampleRate: Double = 60) throws -> CHHapticPattern {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            throw CHHapticError(.engineNotRunning)
        }

        var backgroundEvents: [CHHapticEvent] = []

        let sunshineDuration = duration // Duration for the sunshine pattern
        let patternDuration = sunshineDuration * 10 // Duration for the complete pattern

        let intensityValues: [Double]
        switch strength {
        case .light:
            intensityValues = [0.2, 0.25, 0.3]
        case .medium:
            intensityValues = [0.4, 0.5, 0.6]
        case .hard:
            intensityValues = [0.6, 0.7, 0.8]
        }

        for t in stride(from: 0.0, to: patternDuration, by: 1.0 / sampleRate) {
            let sunshineTime = t.truncatingRemainder(dividingBy: sunshineDuration)
            let intensity = intensityValues[strength.rawValue] * sin(2.0 * Double.pi * sunshineTime / 8)
            let sharpness = 0.3

            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))

            let backgroundEvent = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)

            backgroundEvents.append(backgroundEvent)
        }

        let sunshinePattern = try! CHHapticPattern(events: backgroundEvents, parameters: [])
        return sunshinePattern
    }
    
    private func createMoonlitNightVibration(strength: Strength, duration: Double = 10, sampleRate: Double = 60) throws -> CHHapticPattern {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            throw CHHapticError(.engineNotRunning)
        }

        var backgroundEvents: [CHHapticEvent] = []

        let nightDuration = duration // Duration for the moonlit night pattern
        let patternDuration = nightDuration * 10 // Duration for the complete pattern

        let intensityValues: [Double]
        switch strength {
        case .light:
            intensityValues = [0.2, 0.25, 0.3]
        case .medium:
            intensityValues = [0.4, 0.5, 0.6]
        case .hard:
            intensityValues = [0.6, 0.7, 0.8]
        }

        for t in stride(from: 0.0, to: patternDuration, by: 1.0 / sampleRate) {
            let nightTime = t.truncatingRemainder(dividingBy: nightDuration)
            let intensity = intensityValues[strength.rawValue] * sin(2.0 * Double.pi * nightTime / 10)
            let sharpness = 0.1

            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))

            let backgroundEvent = CHHapticEvent(eventType: .hapticTransient, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)

            backgroundEvents.append(backgroundEvent)
        }

        let moonlitNightPattern = try! CHHapticPattern(events: backgroundEvents, parameters: [])
        return moonlitNightPattern
    }
    
    private func createWinterWindVibration(strength: Strength, duration: Double = 10, sampleRate: Double = 60) throws -> CHHapticPattern {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            throw CHHapticError(.engineNotRunning)
        }

        var backgroundEvents: [CHHapticEvent] = []

        let winterDuration = duration // Duration for the winter wind pattern
        let patternDuration = winterDuration * 10 // Duration for the complete pattern

        let intensityValues: [Double]
        switch strength {
        case .light:
            intensityValues = [0.2, 0.25, 0.3]
        case .medium:
            intensityValues = [0.4, 0.5, 0.6]
        case .hard:
            intensityValues = [0.6, 0.7, 0.8]
        }

        for t in stride(from: 0.0, to: patternDuration, by: 1.0 / sampleRate) {
            let winterTime = t.truncatingRemainder(dividingBy: winterDuration)
            let intensity = intensityValues[strength.rawValue] * sin(2.0 * Double.pi * winterTime / 6)
            let sharpness = 0.8

            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))

            let backgroundEvent = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)

            backgroundEvents.append(backgroundEvent)
        }

        let winterWindPattern = try! CHHapticPattern(events: backgroundEvents, parameters: [])
        return winterWindPattern
    }
    
    private func createRotatingWindVibration(strength: Strength, duration: Double = 10, sampleRate: Double = 60) throws -> CHHapticPattern {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            throw CHHapticError(.engineNotRunning)
        }

        var backgroundEvents: [CHHapticEvent] = []

        let windDuration = duration // Duration for the rotating wind pattern
        let patternDuration = windDuration * 10 // Duration for the complete pattern

        let intensityValues: [Double]
        switch strength {
        case .light:
            intensityValues = [0.2, 0.25, 0.3]
        case .medium:
            intensityValues = [0.4, 0.5, 0.6]
        case .hard:
            intensityValues = [0.6, 0.7, 0.8]
        }

        for t in stride(from: 0.0, to: patternDuration, by: 1.0 / sampleRate) {
            let windTime = t.truncatingRemainder(dividingBy: windDuration)
            let intensity = intensityValues[strength.rawValue] * sin(2.0 * Double.pi * windTime / 5)
            let sharpness = 0.7

            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))

            let backgroundEvent = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)

            backgroundEvents.append(backgroundEvent)
        }

        let rotatingWindPattern = try! CHHapticPattern(events: backgroundEvents, parameters: [])
        return rotatingWindPattern
    }
    
    private func createSparkleVibration(strength: Strength, duration: Double = 10, sampleRate: Double = 60) throws -> CHHapticPattern {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            throw CHHapticError(.engineNotRunning)
        }

        var backgroundEvents: [CHHapticEvent] = []

        let sparkleDuration = duration // Duration for the sparkle pattern
        let patternDuration = sparkleDuration * 10 // Duration for the complete pattern

        let intensityValues: [Double]
        switch strength {
        case .light:
            intensityValues = [0.2, 0.25, 0.3]
        case .medium:
            intensityValues = [0.4, 0.5, 0.6]
        case .hard:
            intensityValues = [0.6, 0.7, 0.8]
        }

        for t in stride(from: 0.0, to: patternDuration, by: 1.0 / sampleRate) {
            let sparkleTime = t.truncatingRemainder(dividingBy: sparkleDuration)
            let intensity = intensityValues[strength.rawValue] * sin(2.0 * Double.pi * sparkleTime / 4)
            let sharpness = 0.5

            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))

            let backgroundEvent = CHHapticEvent(eventType: .hapticTransient, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)

            backgroundEvents.append(backgroundEvent)
        }

        let sparklePattern = try! CHHapticPattern(events: backgroundEvents, parameters: [])
        return sparklePattern
    }
    
    private func createLeavesInWindVibration(strength: Strength, duration: Double = 10, sampleRate: Double = 60) throws -> CHHapticPattern {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            throw CHHapticError(.engineNotRunning)
        }

        var backgroundEvents: [CHHapticEvent] = []

        let windDuration = duration // Duration for the leaves in wind pattern
        let patternDuration = windDuration * 10 // Duration for the complete pattern

        let intensityValues: [Double]
        switch strength {
        case .light:
            intensityValues = [0.2, 0.25, 0.3]
        case .medium:
            intensityValues = [0.4, 0.5, 0.6]
        case .hard:
            intensityValues = [0.6, 0.7, 0.8]
        }

        for t in stride(from: 0.0, to: patternDuration, by: 1.0 / sampleRate) {
            let windTime = t.truncatingRemainder(dividingBy: windDuration)
            let intensity = intensityValues[strength.rawValue] * sin(2.0 * Double.pi * windTime / 6)
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




