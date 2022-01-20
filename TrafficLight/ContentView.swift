//
//  ContentView.swift
//  TrafficLight
//
//  Created by Alisa Ts on 20.01.2022.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}
struct ContentView: View {
    @State private var tapButton = "Go"
    @State private var currentLight = CurrentLight.red
    
    @State var redLight = Color.red
    @State var yellowLight = Color.yellow
    @State var greenLight = Color.green
    
    private var isOn = 1.0
    private var isOff = 0.3
    
    var body: some View {
        
        ZStack {
            Color(.gray.withAlphaComponent(0.6))
                .ignoresSafeArea()
            VStack {
                circleView
                    .foregroundColor(redLight.opacity(isOn))
                circleView
                    .foregroundColor(yellowLight.opacity(isOn))
                circleView
                    .foregroundColor(greenLight.opacity(isOn))
                Spacer()
                Button() {
                    switch currentLight {
                    case .red:
                        self.redLight = Color.red.opacity(Double(isOn))
                        self.greenLight = Color.green.opacity(isOff)
                        self.yellowLight = Color.yellow.opacity(isOff)
                        currentLight = .yellow
                    case .yellow:
                        self.redLight = Color.red.opacity(isOff)
                        self.yellowLight = Color.yellow.opacity(Double(isOn))
                        currentLight = .green
                    case .green:
                        self.yellowLight = Color.yellow.opacity(isOff)
                        self.greenLight = Color.green.opacity(Double(isOn))
                        currentLight = .red
                    }
                } label: {
                    Text("Go")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
                }
                
            }
            .padding()
        }
    }
}


private var circleView: some View {
    Circle()
        .frame(width: 100, height: 100)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
        .padding()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
