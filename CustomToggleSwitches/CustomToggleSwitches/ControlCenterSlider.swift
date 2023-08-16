//
//  ControlCenterSlider.swift
//  CustomToggleSwitches
//
//  Created by Delstun McCray on 8/15/23.
//

import SwiftUI

struct TransparentSlider: View {
    @State private var sliderValue: Double = 0.5
    
    var body: some View {
        VStack {
            Text("Slider Value: \(sliderValue, specifier: "%.2f")")
                .padding()
            
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.gray.opacity(0.45)).blur(radius: 3.0)
                    .frame(width: 100, height: 200)
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.gray.opacity(0.7))
                    .frame(width: 100, height: CGFloat(sliderValue) * 200)
                    .animation(.default)
                
                Image(systemName: "sun.max.fill")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .offset(y: -(CGFloat(sliderValue) * 90) + 10)
                    .animation(.default)
            }
            .padding(.horizontal)
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    updateSliderValue(with: value)
                }
        )
    }
    
    private func updateSliderValue(with value: DragGesture.Value) {
        let totalHeight = 90
        let currentPosition = max(min(value.location.y, CGFloat(totalHeight)), 0)
        sliderValue = Double(currentPosition / CGFloat(totalHeight))
    }
}
