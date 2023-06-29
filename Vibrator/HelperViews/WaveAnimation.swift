//
//  ds.swift
//  Vibrator
//
//  Created by Yasin Erdemli on 27.06.2023.
//

import SwiftUI
struct Wave: Shape {
    // how high our waves should be
    var strength: Double

    // how frequent our waves should be
    var frequency: Double
    var phase: Double
    
    var animatableData: Double {
        get { phase }
        set { self.phase = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()

        // calculate some important values up front
        let width = Double(rect.width)
        let height = Double(rect.height)
        let midWidth = width / 2
        let midHeight = height / 2
        let oneOverMidWidth = 1 / midWidth
        
        

        // split our total width up based on the frequency
        let wavelength = width / frequency

        // start at the left center
        path.move(to: CGPoint(x: 0, y: midHeight))

        // now count across individual horizontal points one by one
        for x in stride(from: 0, through: width, by: 5) {
            // find our current position relative to the wavelength
            let relativeX = x / wavelength
            // find how far we are from the horizontal center
            let distanceFromMidWidth = x - midWidth

            // bring that into the range of -1 to 1
            let normalDistance = oneOverMidWidth * distanceFromMidWidth

            // calculate the sine of that position
            let sine = sin(relativeX + phase)
            

            // multiply that sine by our strength to determine final offset, then move it down to the middle of our view
            
            let parabola = normalDistance
            let y = parabola * strength * sine + midHeight

            // add a line to here
            path.addLine(to: CGPoint(x: x, y: y))
            
        }
        
        path.move(to: CGPoint(x: 0, y: midHeight))
        
        for x in stride(from: 0, through: width, by: 5) {
            // find our current position relative to the wavelength
            let relativeX = x / wavelength
            // find how far we are from the horizontal center
            let distanceFromMidWidth = x - midWidth

            // bring that into the range of -1 to 1
            let normalDistance = oneOverMidWidth * distanceFromMidWidth

            // calculate the sine of that position
            let sine = sin(relativeX + phase)
            

            // multiply that sine by our strength to determine final offset, then move it down to the middle of our view
            
            let parabola = normalDistance
            let y = parabola * strength * sine + midHeight

            // add a line to here
            path.addLine(to: CGPoint(x: x, y: y + 100))
            
        }
        
        path.move(to: CGPoint(x: 0, y: midHeight))
        
        for x in stride(from: 0, through: width, by: 5) {
            // find our current position relative to the wavelength
            let relativeX = x / wavelength
            // find how far we are from the horizontal center
            let distanceFromMidWidth = x - midWidth
            
            // bring that into the range of -1 to 1
            let normalDistance = oneOverMidWidth * distanceFromMidWidth
            
            // calculate the sine of that position
            let sine = sin(relativeX + phase)
            
            
            // multiply that sine by our strength to determine final offset, then move it down to the middle of our view
            
            let parabola = normalDistance
            let y = parabola * strength * sine + midHeight
            
            // add a line to here
            path.addLine(to: CGPoint(x: x, y: y + 200))
            
        }
        
        path.move(to: CGPoint(x: 0, y: midHeight))
        
        for x in stride(from: 0, through: width, by: 5) {
            // find our current position relative to the wavelength
            let relativeX = x / wavelength
            // find how far we are from the horizontal center
            let distanceFromMidWidth = x - midWidth
            
            // bring that into the range of -1 to 1
            let normalDistance = oneOverMidWidth * distanceFromMidWidth
            
            // calculate the sine of that position
            let sine = sin(relativeX + phase)
            
            
            // multiply that sine by our strength to determine final offset, then move it down to the middle of our view
            
            let parabola = normalDistance
            let y = parabola * strength * sine + midHeight
            
            // add a line to here
            path.addLine(to: CGPoint(x: x, y: y + 300))
            
            
            
        }
        
        path.move(to: CGPoint(x: 0, y: midHeight))
        
        for x in stride(from: 0, through: width, by: 5) {
            // find our current position relative to the wavelength
            let relativeX = x / wavelength
            // find how far we are from the horizontal center
            let distanceFromMidWidth = x - midWidth
            
            // bring that into the range of -1 to 1
            let normalDistance = oneOverMidWidth * distanceFromMidWidth
            
            // calculate the sine of that position
            let sine = sin(relativeX + phase)
            
            
            // multiply that sine by our strength to determine final offset, then move it down to the middle of our view
            
            let parabola = normalDistance
            let y = parabola * strength * sine + midHeight
            
            // add a line to here
            path.addLine(to: CGPoint(x: x, y: y + 400))
            
        }
        

        return Path(path.cgPath)
    }
}

struct WaveBackground: View {
    @State private var phase = 0.0
    @State private var timer = Timer.publish(every: 1 , on: .current, in: .common).autoconnect()
    var body: some View {
        ZStack {
            
            Wave(strength: 90, frequency: 13, phase: phase)
                .stroke(Color.purple.opacity(0.5), lineWidth: 9)
            
            Wave(strength: 90, frequency: 13, phase: phase)
                .stroke(Color.orange.opacity(0.5), lineWidth: 9)
                .offset(y: 50)
            
        }
        
        .offset(y: -200)
        .scaleEffect(1.2)
        
        
        .edgesIgnoringSafeArea(.all)
        .frame(height: 400)
        
        .frame(maxHeight: .infinity)
        .background(Color("BackgroundColor"))
        .animation(.linear(duration: 1), value: phase)
        
        .onReceive(timer) { i in
            phase += 1
        }
    }
}


struct ds_Previews: PreviewProvider {
    static var previews: some View {
        WaveBackground()
    }
}