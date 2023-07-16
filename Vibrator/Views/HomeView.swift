//
//  HomeView.swift
//  Vibrator
//
//  Created by Yasin Erdemli on 23.06.2023.
//

import SwiftUI

struct HomeView: View {
    @State private var showSheet: Bool = false
    var body: some View {
        ZStack {
            WaveBackground().ignoresSafeArea()
            VStack(alignment: .leading, spacing: 30) {
                Text("VibroRest")
                    .font(.system(size: 30, weight: .black))
                    .kerning(-0.24)
                    .foregroundStyle(.linearGradient(colors: [.white, Color(hue: 25/360, saturation: 1, brightness: 1), Color(hue: 302/360, saturation: 0.8, brightness: 0.6)], startPoint: .init(x: 0, y: -0.1), endPoint: .init(x: 0, y: 1)))
                    .padding(.bottom, 30)
                
                
                VStack(spacing: 20) {
                        ListItem(text: "Share Us", image: Image(systemName: "square.and.arrow.up"))
                        ListItem(text: "Rate Us", image: Image(systemName: "star"))
                        ListItem(text: "Contact Us", image: Image(systemName: "bubble.left"))
                        ListItem(text: "Restore Purchases", image: Image(systemName: "cube.box"))
                        ListItem(text: "Help", image: Image(systemName: "questionmark.circle"))
                    HStack(spacing: 20) {
                        
                        Button {
                            
                        } label: {
                            ListItemSmall(text: "Privacy Policy", image: Image(systemName: "shield.righthalf.filled"))
                            
                        }
                        Spacer()
                        Button {
                            
                        } label: {
                            ListItemSmall(text: "Terms & Conditions", image: Image(systemName: "doc.append"))
                        }
                        
                    }
                }
                .cornerRadius(10)
                Spacer()
                Button {
                    showSheet.toggle()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(LinearGradient(colors: [Color(hue: 25/360, saturation: 1, brightness: 1), Color(hue: 302/360, saturation: 0.8, brightness: 0.6)], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(height: 57)
                        Text("Open All Features")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
                Spacer()
                
                

            }
            .padding(.vertical, 20)
            .padding(40)
            
            
        }
        .fullScreenCover(isPresented: $showSheet) {
            PurchaseView(showView: $showSheet)
                .presentationBackground(.thinMaterial.opacity(0.5))
        }
    }
    @ViewBuilder func ListItem(text: String, image: Image) -> some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color("BackgroundColor").opacity(0.95) .shadow(.drop(color: Color("ShadowColor2").opacity(0.8), radius: 1, x: 1, y: 1)),.shadow(.drop(color: Color(hue: 247/360, saturation: 0.14, brightness: 0.68, opacity: 0.1), radius: 1, x: -1, y: -1)) )
            HStack {
                Text(text)
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .opacity(0.6)
                
                Spacer()
                
                image
                    .foregroundColor(.white)
                    .frame(height: 20)
            }
            
            .frame(maxWidth: .infinity)
            .padding(.horizontal,22)

        }
        .frame(height: 55)
    }
    
    @ViewBuilder func ListItemSmall(text: String, image: Image) -> some View {
        ZStack {
           
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color("BackgroundColor").opacity(0.95) .shadow(.drop(color: Color("ShadowColor2").opacity(0.8), radius: 1, x: 1, y: 1)),.shadow(.drop(color: Color(hue: 247/360, saturation: 0.14, brightness: 0.68, opacity: 0.1), radius: 1, x: -1, y: -1)) )
            HStack {
                Text(text)
                    .foregroundColor(.white)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .opacity(0.6)
                
                
                
                image
                    .foregroundColor(.white)
                    .frame(height: 12)
            }
            
            .frame(maxWidth: .infinity)
            .padding(.horizontal,10)

        }
        .frame(height: 55)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
