//
//  PurchaseView.swift
//  Vibrator
//
//  Created by Yasin Erdemli on 23.06.2023.
//

import SwiftUI

struct PurchaseView: View {
    @Binding var showView: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 6.85) {
            HStack {
                Image("VibroRest")
                    .resizable()
                    .frame(width: 164.5, height: 51.15)
                Spacer()
                Button {
                    showView.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.trailing)
                .offset(y: -30)
                
            }
            VStack {
                Group {
                    Text("Explore all kind of feelings ") + Text("today").fontWeight(.medium)
                }
                .font(.title3)
            }
            .frame(width: 164.61, height: 55, alignment: .center)
            
            
            VStack(alignment: .leading, spacing: 21.54) {
                textWithImage(text: "All vibrations adjustments are available", image: "Infinity")
                textWithImage(text: "All vibrations adjustments are available", image: "Infinity")
                textWithImage(text: "All vibrations adjustments are available", image: "Infinity")
                textWithImage(text: "All vibrations adjustments are available", image: "Infinity")
            }
            .padding(.top, 139.1)
            
            HStack {
                Spacer()
                ZStack {
                    Rectangle()
                        .fill(.orange)
                        .shimmer(.init(tint: .orange, highlight: .white, highlighOpacity: 0.5))
                        .frame(height: 55, alignment: .center)
                        .cornerRadius(10)
                    
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
                    Text("Sign in with us you accept all our **Terms & Conditions**")
                    Text("and **Privacy Policy**")
                }
                .font(.caption2)
                Spacer()
            }
            .padding(.top, 31)
            
        }
        .padding(30)
    }
    
    @ViewBuilder func textWithImage(text: String, image: String) -> some View {
        HStack(spacing: 21.77) {
            Image(image)
                .resizable()
                .frame(width: 30, height: 30)
            
            Text(text)
                .fontWeight(.light)
        }
    }
}

struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseView(showView: .constant(true))
    }
}
