//
//  PurchaseView.swift
//  Vibrator
//
//  Created by Yasin Erdemli on 23.06.2023.
//

import SwiftUI

struct PurchaseView: View {
    @Binding var showView: Bool
    @State var frameWidth: CGFloat = 200
    var body: some View {
        ZStack {
            WaveBackground().ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Button {
                        showView.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    .padding(.top)
                    .padding(.horizontal, 25)
                }
                VStack(alignment: .center, spacing: 6.85) {
                    Spacer()
                    Text("VibroRest")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .kerning(-0.24)
                        .overlay {
                            GeometryReader { geo in
                                Rectangle()
                                    .fill(.clear)
                            }
                            
                        }
                    Spacer()
                    
                    Text("Focus on yourself now")
                        .font(.system(size: 22, weight: .semibold))
                        .kerning(-0.24)
                    
                    Text("Choose one of the 9 unique sets. Turn on a sound of nature for deeper relaxation. Put a timer to save a battery if you fall asleep.")
                        .multilineTextAlignment(.center)
                    
                    
                    HStack {
                        Spacer()
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(LinearGradient(colors: [Color(hue: 25/360, saturation: 1, brightness: 1), Color(hue: 302/360, saturation: 0.8, brightness: 0.6)], startPoint: .topLeading, endPoint: .bottomTrailing).shadow(.inner(color: Color(hue: 245/360, saturation: 0.49, brightness: 0.08, opacity: 0.66), radius: 2, x: 3, y: 3)), .shadow(.inner(color: .init(hue: 247/360, saturation: 0.14, brightness: 0.68, opacity: 0.27), radius: 2, x: -1, y: -1)))
                                .frame(height: 55, alignment: .center)
                                
                            
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Color(hue: 47/360, saturation: 0.41, brightness: 0.15, opacity: 0.9).shadow(.drop(color: .init(hue: 245/360, saturation: 0.49, brightness: 0.08, opacity: 0.59), radius: 1, x: 1, y: 1)), .shadow(.drop(color: .init(hue: 247/360, saturation: 0.14, brightness: 0.68, opacity: 0.1), radius: 1, x: -1, y: -1)))
                                .frame(height: 50)
                                .frame(width: 230)
                            
                            
                            VStack {
                                Text("Get Now")
                                    .font(.headline)
                                    .fontWeight(.black)
                                
                                Text("For 3 $")
                                    .font(.caption)
                                    .fontWeight(.thin)
                            }
                        }
                        Spacer()
                    }
                    
                    .padding(.top, 155.36)
                    HStack {
                        Spacer()
                        VStack(alignment: .center, spacing: 3) {
                            Text("Sign in with us you accept all our **Terms &**")
                            Text("**Conditions Privacy Policy**")
                        }
                        .font(.caption2)
                        Spacer()
                    }
                    .padding(.top, 31)
                    
                }
                .frame(width: 250)
            }
        }
        
    }
}



struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseView(showView: .constant(true))
    }
}
