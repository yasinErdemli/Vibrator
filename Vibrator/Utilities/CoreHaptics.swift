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
    var arrayOfVibrations : [CHHapticPattern] = []
    
    init() {
        prepareVibrations()
    }
    
    func prepareVibrations() {
        createCalmWavesEvent()
        createGentlePulsationVibration()
        createDeepResonanceVibration()
        createSoftPulsationVibration()
        createEnergyBoostVibration()
        createHeartbeatVibration()
        createOceanWavesVibration()
        createBlissfulPulseVibration()
        createTranquilHumVibration()
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
    
    
    func complexSuccess(intensity: Float, sharpness: Float, type: CHHapticEvent.EventType = .hapticTransient, duration: TimeInterval? = nil) {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness)
        
        let event = CHHapticEvent(eventType: type, parameters: [intensity, sharpness], relativeTime: 0, duration: duration ?? 5)
        events.append(event)
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play Patterns: \(error.localizedDescription)")
        }
    }
    
    func complexSuccessReturns(intensity: Float, sharpness: Float, type: CHHapticEvent.EventType = .hapticTransient, relativeTime: TimeInterval) throws -> CHHapticEvent {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { throw URLError(.dataNotAllowed) }
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness)
        
        let event = CHHapticEvent(eventType: type, parameters: [intensity, sharpness], relativeTime: relativeTime)
        return event
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
    
    private func createCalmWavesEvent()  {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        let frequency = 0.5
        let amplitude = 1.0
        let duration = 50.0
        let sampleRate = 30.0
        
        
        var waveEvents: [CHHapticEvent] = []
        
        for t in stride(from: 0.0, to: duration, by: 1.0 / sampleRate) {
            let intensity = amplitude * sin(2.0 * Double.pi * frequency * t)
            let sharpness = 1.0 - abs(amplitude * sin(Double.pi * frequency * t))
            
            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))
            
            let waveEvent = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)
            
            waveEvents.append(waveEvent)
        }
        let calmWavePattern = try! CHHapticPattern(events: waveEvents, parameters: [])
        arrayOfVibrations.append(calmWavePattern)
    }
    
    private func createGentlePulsationVibration()  {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        let duration = 30.0
        let sampleRate = 30.0
        
        var pulseEvents: [CHHapticEvent] = []
        
        for t in stride(from: 0.0, to: duration, by: 1.0 / sampleRate) {
            let intensity = sin(2.0 * Double.pi * t / duration)
            let sharpness = cos(Double.pi * t / duration)
            
            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))
            
            let pulseEvent = CHHapticEvent(eventType: .hapticTransient, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)
            
            pulseEvents.append(pulseEvent)
        }
        
        let gentlePulsationVibrationPattern = try! CHHapticPattern(events: pulseEvents, parameters: [])
        arrayOfVibrations.append(gentlePulsationVibrationPattern)
    }
    
    private func createDeepResonanceVibration() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        let frequency = 1.0
        let amplitude = 2.0
        let duration = 8.0
        let sampleRate = 30.0
        
        var resonanceEvents: [CHHapticEvent] = []
        
        for t in stride(from: 0.0, to: duration, by: 1.0 / sampleRate) {
            let intensity = amplitude * sin(2.0 * Double.pi * frequency * t)
            let sharpness = 0.5
            
            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))
            
            let resonanceEvent = CHHapticEvent(eventType: .hapticTransient, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)
            
            resonanceEvents.append(resonanceEvent)
        }
        
        let pattern = try! CHHapticPattern(events: resonanceEvents, parameters: [])
        arrayOfVibrations.append(pattern)
    }
    
    private func createSoftPulsationVibration() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        let duration = 6.0
        let sampleRate = 30.0
        
        var pulseEvents: [CHHapticEvent] = []
        
        for t in stride(from: 0.0, to: duration, by: 1.0 / sampleRate) {
            let intensity = sin(2.0 * Double.pi * t / duration) * 0.5 + 0.5
            let sharpness = cos(Double.pi * t / duration) * 0.5 + 0.5
            
            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))
            
            let pulseEvent = CHHapticEvent(eventType: .hapticTransient, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)
            
            pulseEvents.append(pulseEvent)
        }
        
        let pattern = try! CHHapticPattern(events: pulseEvents, parameters: [])
        arrayOfVibrations.append(pattern)
        
    }
    
    private func createEnergyBoostVibration() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        let frequency = 1.0
        let amplitude = 1.0
        let duration = 3.0
        let sampleRate = 30.0
        
        var boostEvents: [CHHapticEvent] = []
        
        for t in stride(from: 0.0, to: duration, by: 1.0 / sampleRate) {
            let intensity = amplitude * sin(2.0 * Double.pi * frequency * t)
            let sharpness = 1.0 - abs(amplitude * sin(Double.pi * frequency * t))
            
            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))
            
            let boostEvent = CHHapticEvent(eventType: .hapticTransient, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)
            
            boostEvents.append(boostEvent)
        }
        
        let pattern = try! CHHapticPattern(events: boostEvents, parameters: [])
        arrayOfVibrations.append(pattern)
    }
    
    private func createHeartbeatVibration() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        let frequency = 1.5
        let amplitude = 1.0
        let duration = 10.0
        let sampleRate = 30.0
        
        var heartbeatEvents: [CHHapticEvent] = []
        
        for t in stride(from: 0.0, to: duration, by: 1.0 / sampleRate) {
            let intensity = amplitude * sin(2.0 * Double.pi * frequency * t)
            let sharpness = 1.0 - abs(amplitude * sin(Double.pi * frequency * t))
            
            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))
            
            let heartbeatEvent = CHHapticEvent(eventType: .hapticTransient, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)
            
            heartbeatEvents.append(heartbeatEvent)
        }
        
        let pattern = try! CHHapticPattern(events: heartbeatEvents, parameters: [])
        arrayOfVibrations.append(pattern)
    }
    
    private func createOceanWavesVibration() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        let frequency = 0.8
        let amplitude = 1.0
        let duration = 12.0
        let sampleRate = 30.0
        
        var waveEvents: [CHHapticEvent] = []
        
        for t in stride(from: 0.0, to: duration, by: 1.0 / sampleRate) {
            let intensity = amplitude * sin(2.0 * Double.pi * frequency * t)
            let sharpness = 1.0 - abs(amplitude * sin(Double.pi * frequency * t))
            
            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))
            
            let waveEvent = CHHapticEvent(eventType: .hapticTransient, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)
            
            waveEvents.append(waveEvent)
        }
        
        let pattern = try! CHHapticPattern(events: waveEvents, parameters: [])
        arrayOfVibrations.append(pattern)
    }
    
    private func createBlissfulPulseVibration()  {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        let frequency = 1.2
        let amplitude = 0.8
        let duration = 8.0
        let sampleRate = 30.0
        
        var pulseEvents: [CHHapticEvent] = []
        
        for t in stride(from: 0.0, to: duration, by: 1.0 / sampleRate) {
            let intensity = amplitude * sin(2.0 * Double.pi * frequency * t)
            let sharpness = 1.0 - abs(amplitude * sin(Double.pi * frequency * t))
            
            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))
            
            let pulseEvent = CHHapticEvent(eventType: .hapticTransient, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)
            
            pulseEvents.append(pulseEvent)
        }
        
        let pattern = try! CHHapticPattern(events: pulseEvents, parameters: [])
        arrayOfVibrations.append(pattern)
        
    }
    
    private func createTranquilHumVibration() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        let frequency = 0.4
        let amplitude = 0.6
        let duration = 10.0
        let sampleRate = 30.0
        
        var humEvents: [CHHapticEvent] = []
        
        for t in stride(from: 0.0, to: duration, by: 1.0 / sampleRate) {
            let intensity = amplitude * sin(2.0 * Double.pi * frequency * t)
            let sharpness = 1.0 - abs(amplitude * sin(Double.pi * frequency * t))
            
            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpness))
            
            let humEvent = CHHapticEvent(eventType: .hapticTransient, parameters: [intensityParam, sharpnessParam], relativeTime: t, duration: 1.0 / sampleRate)
            
            humEvents.append(humEvent)
        }
        
        let pattern = try! CHHapticPattern(events: humEvents, parameters: [])
        arrayOfVibrations.append(pattern)
        
    }
    
}
