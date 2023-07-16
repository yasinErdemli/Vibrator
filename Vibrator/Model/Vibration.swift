//
//  VibrationStruct.swift
//  Vibrator
//
//  Created by Yasin Erdemli on 16.07.2023.
//

import Foundation
import SwiftUI

struct VibrationStruct {
    var vibration: Vibration
    var duration: Double
    var sampleRate: Double
    var strength: Strength
}

enum Strength: Int, CustomStringConvertible, CaseIterable {
    case light = 0
    case medium = 1
    case hard = 2
    
    var description: String {
        switch self {
        case .light:
            return "Light"
        case .medium:
            return "Medium"
        case .hard:
            return "Hard"
        }
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

