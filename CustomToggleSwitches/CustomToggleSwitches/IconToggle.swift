//
//  IconToggle.swift
//  CustomToggleSwitches
//
//  Created by Delstun McCray on 8/15/23.
//

import SwiftUI

struct IconToggle: View {
    @State private var isOn = false
    
    var body: some View {
        Toggle("", isOn: $isOn)
            .toggleStyle(IconToggleStyle())
    }
}

struct IconToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "xmark.circle.fill")
                .font(.system(size: 30))
                .foregroundColor(configuration.isOn ? .green : .red)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(20)
        .onTapGesture {
            configuration.isOn.toggle()
        }
    }
}

