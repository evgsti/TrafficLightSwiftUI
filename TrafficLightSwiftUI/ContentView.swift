//
//  ContentView.swift
//  TrafficLightSwiftUI
//
//  Created by Евгений on 07.10.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonTitle = "START"
    @State private var currentCircleIndex = -1
    
    private let circleOpacity = 0.3
    
    private let circleSize: CGFloat = 115
    private let bottomPadding: CGFloat = 15
    private let cornerRadius: CGFloat = 15
    private let lineWidth: CGFloat = 5
    
    var body: some View {
        VStack(alignment: .center) {
            Circle()
                .frame(width: circleSize, height: circleSize)
                .foregroundStyle(.red)
                .opacity(currentCircleIndex == 0 ? 1.0 : circleOpacity)
                .overlay(
                    Circle().stroke(Color.white, lineWidth: lineWidth)
                )
                .padding(.bottom, bottomPadding)
            
            Circle()
                .frame(width: circleSize, height: circleSize)
                .foregroundStyle(.yellow)
                .opacity(currentCircleIndex == 1 ? 1.0 : circleOpacity)
                .overlay(
                    Circle().stroke(Color.white, lineWidth: lineWidth)
                )
                .padding(.bottom, bottomPadding)
            
            Circle()
                .frame(width: circleSize, height: circleSize)
                .foregroundStyle(.green)
                .opacity(currentCircleIndex == 2 ? 1.0 : circleOpacity)
                .overlay(
                    Circle().stroke(Color.white, lineWidth: lineWidth)
                )
            
            Spacer()
            
            Button(action: changeColor) {
                Text(buttonTitle)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(width: 200, height: 65)
                    .background(.tint)
                    .cornerRadius(cornerRadius)
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(.white, lineWidth: lineWidth)
                    )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
    
    private func changeColor() {
        if buttonTitle == "START" {
            buttonTitle = "NEXT"
        }
        
        currentCircleIndex = (currentCircleIndex + 1) % 3
    }
}

#Preview {
    ContentView()
}
