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
    
    @State private var currentLight = CurrentLight.red
    @State private var onTap = "Start"
    
    
    private func changeColor() {
        switch currentLight {
        case .red: currentLight = .yellow
        case .yellow: currentLight = .green
        case .green: currentLight = .red
        }
    }
}

extension ContentView {
    var body: some View {
        
        ZStack {
            Color(.gray.withAlphaComponent(0.6))
                .ignoresSafeArea()
            VStack {
                ColorCircleView(color: .red, opacity: currentLight == .red ? 1 : 0.3)
                ColorCircleView(color: .yellow, opacity: currentLight == .yellow ? 1 : 0.3)
                ColorCircleView(color: .green, opacity: currentLight == .green ? 1 : 0.3)
                
                Spacer()
                
                ChangeColorButton(title: onTap) {
                    if onTap == "Start" {
                        onTap = "Next"
                    }
                    changeColor()
                }
                
            }
            .padding()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
