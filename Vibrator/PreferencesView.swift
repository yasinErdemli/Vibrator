//
//  PreferencesView.swift
//  Vibrator
//
//  Created by Yasin Erdemli on 29.06.2023.
//

import SwiftUI

struct PreferencesView: View {
    var body: some View {
        VStack(spacing: 30) {
            HStack(spacing: 25) {
                Spacer()
                textWithIcon(text: "Sounds", icon: "music.note")
                textWithIcon(text: "Timer", icon: "clock")
            }
            .padding(.trailing, 60)
            
            VStack(alignment: .leading, spacing: 30) {
                Text("Sets")
                
                Grid(horizontalSpacing: 24.86, verticalSpacing: 24.86) {
                    GridRow {
                        ButtonWithIcon(icon: "flame", height: 45, gradient: [Color(red: 1, green: 165 / 255, blue: 30 / 255), Color(red: 189/255, green: 11/255, blue: 0)])
                        ButtonWithIcon(icon: "water.waves", height: 36, gradient: [Color(red: 75/255, green: 1, blue: 212/255), Color(red: 4/255, green: 69/255, blue: 144/255)])
                        ButtonWithIcon(icon: "bolt", height: 45, gradient: [Color(red: 1, green: 214/255, blue: 0), Color(red: 1, green: 138/255, blue: 0)])
                    }
                    
                    GridRow {
                        ButtonWithIcon(icon: "allergens", height: 45, gradient: [Color(red: 169/255, green: 99/255, blue: 1), Color(red: 112/255, green: 0, blue: 1)])
                        ButtonWithIcon(icon: "moon.stars", height: 45, gradient: [Color(hue: 0, saturation: 0, brightness: 1), Color(hue: 54/360, saturation: 0.86, brightness: 1)])
                        ButtonWithIcon(icon: "wind.snow", height: 45, gradient: [Color(hue: 194/360, saturation: 0.57, brightness: 1), Color(hue: 194/360, saturation: 0.07, brightness: 1)])
                    }
                    
                    GridRow {
                        ButtonWithIcon(icon: "tornado", height: 45, gradient: [Color(hue: 223/360, saturation: 0, brightness: 0.71), Color(hue: 223/360, saturation: 1, brightness: 0.92)])
                        ButtonWithIcon(icon: "sparkles", height: 45, gradient: [Color(hue: 0, saturation: 0, brightness: 71/100), Color(hue: 281/360, saturation: 1, brightness: 92/100)])
                        ButtonWithIcon(icon: "leaf", height: 38, gradient: [Color(hue: 94/360, saturation: 67/100, brightness: 86/100)])
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 21.7) {
                HStack {
                    StrengthText(text: "Light")
                    StrengthText(text: "Medium")
                        .grayscale(1)
                    StrengthText(text: "Hard")
                        .grayscale(1)
                }
            }
        }
    }
    @ViewBuilder func textWithIcon(text: String, icon: String) -> some View {
        VStack(alignment: .center, spacing: 10) {
            Text(text)
                .font(.body)
                .foregroundColor(.white)
                .kerning(-0.24)
                .opacity(0.8)
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color("BackgroundColor").opacity(0.9).shadow(.drop(color: Color("ShadowColor"), radius: 0.5, x: 1, y: 1))
                        .shadow(.drop(color: Color("PreferenceButtonLightShadow"), radius: 0.5, x: -1, y: -1)))
                    .blur(radius: 1)
                    .frame(width: 50, height: 50, alignment: .center)
                
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    .foregroundStyle(Gradient(colors: [.white, Color(red: 255 / 255, green: 108 / 255, blue: 0), Color(red: 255 / 255, green: 108 / 255, blue: 0), Color(red: 154 / 255, green: 31 / 255, blue: 149 / 255)]))
            }
        }
    }
    
    @ViewBuilder func ButtonWithIcon(icon: String, height: CGFloat, gradient: [Color]) -> some View{
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color("BackgroundColor").opacity(0.9).shadow(.drop(color: Color("ShadowColor"), radius: 5, x: 1, y: 1))
                    .shadow(.drop(color: Color("PreferenceButtonLightShadow"), radius: 5, x: -1, y: -1)))
                .blur(radius: 1)
                .frame(width: 84.16, height: 84.16, alignment: .center)
            
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(height: height)
                .foregroundStyle(Gradient(colors: gradient))
        }
    }
    
    @ViewBuilder func StrengthText(text: String) -> some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(LinearGradient(colors: [Color(hue: 0, saturation: 0, brightness: 1), Color(hue: 25/360, saturation: 1, brightness: 1), Color(hue: 302/360, saturation: 0.8, brightness: 0.6)], startPoint: .topLeading, endPoint: .bottomTrailing).shadow(.inner(color: Color(hue: 245/360, saturation: 0.49, brightness: 0.08, opacity: 0.66), radius: 2, x: 3, y: 3)),.shadow(.inner(color: Color(hue: 247/360, saturation: 0.14, brightness: 0.68, opacity: 0.27), radius: 1, x: -1, y: -1)))
                .frame(width: 82, height: 43.8)
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle( Color("BackgroundColor").shadow(.drop(color: Color(hue: 245/360, saturation: 0.49, brightness: 0.08, opacity: 0.15), radius: 1, x: 1, y: 1)),.shadow(.drop(color: Color(hue: 247/360, saturation: 0.14, brightness: 0.68, opacity: 0.1), radius: 1, x: -1, y: -1)))
                .frame(width: 77.1, height: 38)
            
            LinearGradient(colors: [Color(hue: 0, saturation: 0, brightness: 1), Color(hue: 25/360, saturation: 1, brightness: 1), Color(hue: 302/360, saturation: 0.8, brightness: 0.6)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .mask {
                    Text(text)
                }
            
            
        }
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
