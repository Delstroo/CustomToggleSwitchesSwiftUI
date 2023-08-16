//
//  AppleStyleSlider.swift
//  CustomToggleSwitches
//
//  Created by Delstun McCray on 8/15/23.
//

import SwiftUI

struct AppleStyleSlider: View {
    @State private var sliderValue: Double = 0.5
    @State private var isDragging = false
    
    var body: some View {
        VStack {
            Text("Slider Value: \(sliderValue, specifier: "%.2f")")
                .padding()
            
            ZStack(alignment: .leading) {
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)
                    .frame(height: 4)
                    .cornerRadius(2)
                
                Circle()
                    .frame(width: 16, height: 16)
                    .foregroundColor(.white)
                    .shadow(radius: 3)
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 2)
                            .foregroundColor(Color.gray.opacity(0.5))
                    )
                    .offset(x: CGFloat(sliderValue) * UIScreen.main.bounds.width - 8)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                isDragging = true
                                updateSliderValue(with: value)
                            }
                            .onEnded { value in
                                isDragging = false
                                updateSliderValue(with: value)
                            }
                    )
                    .scaleEffect(isDragging ? 1.2 : 1.0) // Apply scaling animation
            }
            .padding(.horizontal)
        }
    }
    
    private func updateSliderValue(with value: DragGesture.Value) {
        let totalWidth = UIScreen.main.bounds.width - 16
        let currentPosition = max(min(value.location.x - 8, totalWidth), 0)
        sliderValue = Double(currentPosition / totalWidth)
    }
}

