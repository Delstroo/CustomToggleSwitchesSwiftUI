//
//  ColorGradientView.swift
//  CustomToggleSwitches
//
//  Created by Delstun McCray on 8/15/23.
//

import SwiftUI

struct GradientToggle: View {
    @State private var isOn = false
    
    var body: some View {
        Toggle("", isOn: $isOn)
            .toggleStyle(GradientToggleStyle())
    }
}

struct GradientToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        let gradient = LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing)
        
        return configuration.label
            .padding(.horizontal) // Adjusted horizontal padding
            .background( RoundedRectangle(cornerRadius: 20).fill(gradient) )
            .frame(height: 40) // Adjusted height
            .onTapGesture {
                configuration.isOn.toggle()
            }
    }
}

