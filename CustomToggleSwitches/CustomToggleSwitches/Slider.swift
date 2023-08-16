//
//  Slider.swift
//  CustomToggleSwitches
//
//  Created by Delstun McCray on 8/15/23.
//

import SwiftUI

struct SliderWithLabel: View {
    @State private var value: Double = 0.5
    @State private var isOn = false
    
    var body: some View {
        SliderToggle()
            .padding()
        VStack {
            Text("Value: \(value, specifier: "%.2f")")
                .padding()
            
            HStack {
                Text("Off")
                Slider(value: $value, in: 0...1)
                Text("On")
            }
            .padding()
        }
    }
}


struct SliderToggle: View {
    @State private var isOn = false
    
    var body: some View {
        Toggle("", isOn: $isOn)
            .toggleStyle(SliderToggleStyl())
    }
}

struct SliderToggleStyl: ToggleStyle {
    @State private var isOn = false
    func makeBody(configuration: Configuration) -> some View {
        let width: CGFloat = 60
        let height: CGFloat = 30
        
        return HStack {
            configuration.label
            
            ZStack {
                RoundedRectangle(cornerRadius: height / 2)
                    .frame(width: width, height: height)
                    .foregroundColor(isOn ? .green : .gray)
                    .animation(.spring())
                
                Circle()
                    .frame(width: height - 6, height: height - 6)
                    .foregroundColor(.white)
                    .shadow(radius: 2)
                    .offset(x: isOn ? width / 2 - height / 2 + 3 : -width / 2 + height / 2 - 3)
                    .animation(.spring())
            }
            .onTapGesture {
                isOn.toggle()
            }
        }
    }
}

struct SliderToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        let circleDiameter: CGFloat = 25
        
        return ZStack {
            RoundedRectangle(cornerRadius: circleDiameter / 2)
                .frame(width: circleDiameter * 2, height: circleDiameter)
                .foregroundColor(configuration.isOn ? .green : .gray)
                .animation(.default)
                .offset(x: configuration.isOn ? circleDiameter : -circleDiameter)
            Circle()
                .frame(width: circleDiameter, height: circleDiameter)
                .foregroundColor(.white)
                .shadow(radius: 2)
                .offset(x: configuration.isOn ? circleDiameter / 2 : -circleDiameter / 2)
        }
        .onTapGesture {
            configuration.isOn.toggle()
        }
    }
}
