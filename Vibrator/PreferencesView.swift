//
//  PreferencesView.swift
//  Vibrator
//
//  Created by Yasin Erdemli on 29.06.2023.
//

import SwiftUI
import CoreHaptics

struct PreferencesView: View {
    @Binding var item: VibrationStruct
    let manager = Haptic.shared
    var body: some View {
        VStack(spacing: 25) {
            HStack(spacing: 25) {
                Spacer()
                textWithIcon(text: "Sounds", icon: "music.note")
                textWithIcon(text: "Timer", icon: "clock")
            }
            .padding(.trailing, 60)
            
            VStack(alignment: .leading, spacing: 30) {
                Text("Sets")
                LazyVGrid(columns: [.init(.flexible()), .init(.flexible()), .init(.flexible())], spacing: 15) {
                    ForEach(Vibration.allCases, id: \.self) { item in
                       ButtonWithIcon(vibration: item)
                            .onTapGesture {
                                self.item.vibration = item
                            }
                    }
                }
                .scaleEffect(1.1)
            }
            .padding(.horizontal, 50)
            
            VStack(alignment: .leading, spacing: 21.7) {
                Text("Strength")
                HStack(spacing: 45) {
                    ForEach(Strength.allCases, id: \.self) { strength in
                        StrengthText(text: strength.description)
//                            .grayscale(strength == self.strength ? 0 : 1)
//                            .onTapGesture {
//                                self.strength = strength
//                            }
                    }
                }
                
                .frame(maxWidth: .infinity)
                
                
            }
            .padding(.horizontal, 50)
            VStack(alignment: .leading, spacing: 25) {
                Text("Speed")
                
                CustomSliderView(value: $item.sampleRate, sliderRange: 10...100)
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 50)
        }
        .animation(.default, value: item.vibration)
//        .onDisappear {
//            let myData = CustomInitForHaptic(name: chosenName, duration: chosenDuration, sampleRate: chosenSampleRate)
//            let encoder = JSONEncoder()
//            guard let jsonData = try? encoder.encode(myData) else { return }
//            guard let bundleURL = Bundle.main.url(forResource: "data", withExtension: "json") else { return }
//
//            do {
//                try jsonData.write(to: bundleURL)
//            } catch {
//                print(error.localizedDescription)
//            }
//
//        }
        
    }
    @ViewBuilder func textWithIcon(text: String, icon: String) -> some View {
        VStack(alignment: .center, spacing: 10) {
            Text(text)
                .font(.body)
                .foregroundColor(.white)
                .kerning(-0.24)
                .opacity(0.8)
            
            ZStack {
                if self.item.vibration.icon != icon {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color("BackgroundColor").opacity(0.9).shadow(.drop(color: Color("ShadowColor"), radius: 0.5, x: 1, y: 1))
                            .shadow(.drop(color: Color("PreferenceButtonLightShadow"), radius: 0.5, x: -1, y: -1)))
                        
                        .frame(width: 50, height: 50, alignment: .center)
                } else {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color(hue: 251/360, saturation: 0.44, brightness: 0.15, opacity: 0.9).shadow(.inner(color: Color(hue: 245/360, saturation: 0.49, brightness: 0.08, opacity: 0.8), radius: 0.5, x: 1, y: 1)) .shadow(.inner(color: Color(hue: 247/360, saturation: 0.14, brightness: 0.68, opacity: 0.1), radius: 0.5, x: -1, y: -1)))
                        
                        .frame(width: 50, height: 50, alignment: .center)
                }
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    .foregroundStyle(Gradient(colors: [.white, Color(red: 255 / 255, green: 108 / 255, blue: 0), Color(red: 255 / 255, green: 108 / 255, blue: 0), Color(red: 154 / 255, green: 31 / 255, blue: 149 / 255)]))
            }
        }
    }
    
    @ViewBuilder func ButtonWithIcon(vibration: Vibration) -> some View{
        ZStack {
            if self.item.vibration == vibration {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color("BackgroundColor").opacity(0.9).shadow(.drop(color: Color("ShadowColor"), radius: 5, x: 1, y: 1))
                        .shadow(.drop(color: Color("PreferenceButtonLightShadow"), radius: 5, x: -1, y: -1)))
                    .frame(width: 84.16, height: 84.16, alignment: .center)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(hue: 251/360, saturation: 0.44, brightness: 0.15, opacity: 0.9).shadow(.inner(color: Color(hue: 245/360, saturation: 0.49, brightness: 0.08, opacity: 0.8), radius: 0.5, x: 1, y: 1)) .shadow(.inner(color: Color(hue: 247/360, saturation: 0.14, brightness: 0.68, opacity: 0.1), radius: 0.5, x: -1, y: -1)))
                    .frame(width: 84.16, height: 84.16, alignment: .center)
            }
            Image(systemName: vibration.icon)
                .resizable()
                .scaledToFit()
                .frame(height: vibration.height)
                .foregroundStyle(self.item.vibration == vibration ? Gradient(colors: vibration.gradient) : Gradient(colors: vibration.gradient))
                .opacity(self.item.vibration == vibration ? 1 : 0.3)
                
        }
    }
    
    @ViewBuilder func StrengthText(text: String) -> some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(LinearGradient(colors: [Color(hue: 0, saturation: 0, brightness: 1), Color(hue: 25/360, saturation: 1, brightness: 1), Color(hue: 302/360, saturation: 0.8, brightness: 0.6)], startPoint: .topLeading, endPoint: .bottomTrailing).shadow(.inner(color: Color(hue: 245/360, saturation: 0.49, brightness: 0.08, opacity: 0.66), radius: 2, x: 3, y: 3)),.shadow(.inner(color: Color(hue: 247/360, saturation: 0.14, brightness: 0.68, opacity: 0.27), radius: 1, x: -1, y: -1)))
                .frame(width: 82, height: 43.8)
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle( Color("BackgroundColor").shadow(.drop(color: Color(hue: 245/360, saturation: 0.49, brightness: 0.08, opacity: 0.15), radius: 1, x: 1, y: 1)),.shadow(.drop(color: Color(hue: 247/360, saturation: 0.14, brightness: 0.68, opacity: 0.1), radius: 1, x: -1, y: -1)))
                .frame(width: 79, height: 40.8)
            
            LinearGradient(colors: [Color(hue: 0, saturation: 0, brightness: 1), Color(hue: 25/360, saturation: 1, brightness: 1), Color(hue: 302/360, saturation: 0.8, brightness: 0.6)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .mask {
                    Text(text)
                        .font(.callout)
                        .kerning(-0.24)
                }
            
            
        }
        .frame(width: 82, height: 43.8)
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView(item: .constant(.init(vibration: .fireplace, duration: 10, sampleRate: 60)))
    }
}

enum Strength: String, CustomStringConvertible, CaseIterable {
    case light
    case medium
    case hard
    
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


