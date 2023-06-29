//
//  HomeView.swift
//  Vibrator
//
//  Created by Yasin Erdemli on 23.06.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
//            BackgroundView().ignoresSafeArea()
            WaveBackground().ignoresSafeArea()
            VStack(alignment: .leading, spacing: 30) {
                Image("VibroRest")
                    .resizable()
                    .opacity(0.5)
                    .frame(width: 164.5, height: 51.15, alignment: .center)
                    .padding(.top, 25)
                
                Spacer()
                
                VStack {
                    Group {
                        ListItem(text: "Share Us", image: Image(systemName: "paperplane"))
                        ListItem(text: "Rate Us", image: Image(systemName: "star"))
                        ListItem(text: "Contact Us", image: Image(systemName: "ellipsis.bubble"))
                        ListItem(text: "Restore Purchases", image: Image(systemName: "cube.box"))
                        ListItem(text: "Help", image: Image("Call").resizable())
                    }
                    .padding()
                }
                .padding()
                .background(.thinMaterial.opacity(0.8))
                .cornerRadius(10)
                Spacer()
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .fill(Color("Orange"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.ultraThinMaterial.opacity(0.5))
                            .frame(height: 53)
                            
                        
                        Text("Open All Features")
                            .font(.headline)
                            .foregroundColor(.white)
                            
                    }
                }
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Privacy Policy")
                            .fontWeight(.thin)
                            .opacity(0.52)
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Terms & Conditions")
                            .fontWeight(.thin)
                            .opacity(0.52)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                .font(.caption)

            }
            .padding(40)
            .padding(.bottom, 70)
            .padding(.horizontal, 20)
        }
    }
    @ViewBuilder func ListItem(text: String, image: Image) -> some View {
        HStack {
            Text(text)
                .font(.title3)
                .fontWeight(.regular)
                .opacity(0.6)
            
            Spacer()
            
            image
                .foregroundColor(Color("Orange"))
                .frame(width: 22, height: 22)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
