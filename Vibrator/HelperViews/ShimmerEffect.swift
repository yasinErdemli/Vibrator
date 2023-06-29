//
//  ShimmerEffect.swift
//  Vibrator
//
//  Created by Yasin Erdemli on 23.06.2023.
//

import SwiftUI

extension View {
    @ViewBuilder
    func shimmer(_ config: ShimmerConfig) -> some View {
        self
            .modifier(ShimmerEffectHelper(config: config))
    }
}

fileprivate struct ShimmerEffectHelper: ViewModifier {
    var config: ShimmerConfig
    @State private var moveTo: CGFloat = -0.7
    func body(content: Content) -> some View {
        content
            .hidden()
            .overlay {
                Rectangle()
                    .fill(config.tint)
                    .mask{
                        content
                    }
                    .overlay {
                        GeometryReader {
                            let size = $0.size
                            
                            Rectangle()
                                .fill(config.highlight)
                                .mask({
                                    Rectangle()
                                        .fill(LinearGradient(colors: [.white.opacity(0), config.highlight.opacity(config.highlighOpacity),.white.opacity(0)], startPoint: .top, endPoint: .bottom))
                                        .blur(radius: config.blur)
                                        .rotationEffect(.degrees(-70))
                                        .offset(x: size.width * moveTo)
                                })
                        }
                    }
                    .onAppear {
                        moveTo = 0.7
                    }
                    .animation(.linear(duration: config.speed).repeatForever(autoreverses: false), value: moveTo)
            }
            
    }
}

struct ShimmerConfig {
    var tint: Color
    var highlight: Color
    var blur: CGFloat = 0
    var highlighOpacity: CGFloat = 1
    var speed: CGFloat = 2
}


