//
//  CustomSliderView.swift
//  Vibrator
//
//  Created by Yasin Erdemli on 30.06.2023.
//

import SwiftUI

struct CustomSliderView: View {
    @Binding var value: Double
    @State var lastCoordinateValue: CGFloat = 0.0
    var sliderRange: ClosedRange<Double> = 1...100
    
    var body: some View {
        GeometryReader { gr in
            let thumbSize = gr.size.height * 0.3
            let minValue = gr.size.width * 0.015
            let maxValue = gr.size.width * 0.98 - thumbSize - 19 // Subtract thumb size and padding
            
            let scaleFactor = (maxValue - minValue) / CGFloat(sliderRange.upperBound - sliderRange.lowerBound)
            let lower = CGFloat(sliderRange.lowerBound)
            let sliderVal = (CGFloat(value) - lower) * scaleFactor + minValue
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(hue: 249/360, saturation: 0.45, brightness: 0.13, opacity: 0.8).gradient.shadow(.drop(color: Color(hue: 247/360, saturation: 0.47, brightness: 0.1, opacity: 1), radius: 2.5, x: 3, y: 3)),.shadow(.drop(color: .white.opacity(0.9), radius: 0.8, x: -1, y: -1)))
                    .frame(height: 30.7)
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(hue: 249/360, saturation: 0.45, brightness: 0.13, opacity: 0.8).gradient.shadow(.inner(color: Color(hue: 247/360, saturation: 0.49, brightness: 0.11, opacity: 1), radius: 1.2, x: 3, y: 3)) .shadow(.inner(color: .white.opacity(0.12), radius: 1.5, x: -3, y: -3)))
                    .frame(height: 23.32)
                    .padding(.horizontal, 3)
                
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(LinearGradient(colors: [Color(hue: 248/360, saturation: 0.57, brightness: 0.66), Color(hue: 302/360, saturation: 0.8, brightness: 0.6)], startPoint: .top, endPoint: .bottom))
                        .frame(width: CGFloat(min(max(minValue, sliderVal), maxValue)), height: 11)
                        .padding(.horizontal, 10)
                    
                    Spacer()
                }
                
                HStack {
                    Circle()
                        .foregroundStyle(Color(hue: 25/360, saturation: 1, brightness: 1).shadow(.drop(color: .black.opacity(0.25), radius: 1, x: 2, y: 0)) .shadow(.inner(color: Color(hue: 25/360, saturation: 0.97, brightness: 0.56, opacity: 0.54), radius: 0.1, x: -2, y: -2)), .shadow(.inner(color: .white.opacity(0.26), radius: 0.3, x: -2, y: -2)))
                        .frame(height: 20.72)
                        .offset(x: CGFloat(min(max(minValue, sliderVal), maxValue)))
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { v in
                                    if abs(v.translation.width) < 0.1 {
                                        self.lastCoordinateValue = sliderVal
                                    }
                                    if v.translation.width > 0 {
                                        let nextCoordinateValue = min(maxValue, self.lastCoordinateValue + v.translation.width)
                                        self.value = Double((nextCoordinateValue - minValue) / scaleFactor) + Double(lower)
                                    } else {
                                        let nextCoordinateValue = max(minValue, self.lastCoordinateValue + v.translation.width)
                                        self.value = Double((nextCoordinateValue - minValue) / scaleFactor) + Double(lower)
                                    }
                                }
                        )
                    Spacer()
                }
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct CustomSliderView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSliderView(value: .constant(25), sliderRange: 1...45)
    }
}

