//
//  ChengeColorButton.swift
//  TrafficLight
//
//  Created by Alisa Ts on 22.01.2022.
//

import SwiftUI

struct ChangeColorButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 4)
                )
                .background(.blue)
                .shadow(radius: 10)
        }
    }
}

struct ChengeColorButton_Previews: PreviewProvider {
    static var previews: some View {
        ChangeColorButton(title: "Start", action: {})
    }
}
